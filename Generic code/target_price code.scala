val (coreDF: DataFrame, itemLocDF: DataFrame, marketStateDF: DataFrame) = {
      DataSetup.prepareCoreInputData(pipeLineConfig, periodEndDate)(sparkSession)
    }
    logInfo("Core data setup completed")

    val activeILSDF: DataFrame = {
      Transformation.enrichStoreData(coreDF.filter(s" $CHANNEL_N = '$STORE' "), itemLocDF)
        .withColumnRenamed(COST_A, STORE_COST_A)
        .dropDuplicates(Seq(ApplicationConstants.TCIN, ApplicationConstants.LOCATION_ID))
        .persist(StorageLevel.MEMORY_AND_DISK_2)
    }
    logInfo("Enrich store data completed")

    logInfo("Loading Item table with Digital filters to join with core data")
    val ItemTableDF = {
      SinkServices.readItemTable(
        pipeLineConfig.config.getString(APP_ITEM_EXT))(sparkSession: SparkSession)
    }

    val digitalAllDF = coreDF.filter(s" $CHANNEL_N = 'DIGITAL' ").join(ItemTableDF, Seq(TCIN), INNER)
                             .drop(coreDF(ApplicationConstants.CLASS_ID))
                             .drop(coreDF(ApplicationConstants.DPCI))
                             .drop(coreDF(ApplicationConstants.DEPARTMENT_ID))
                             .drop(ItemTableDF(ApplicationConstants.ESTORE_ITEM_STATUS_C))

    logInfo("Join completed with Digital data and core data")

    val digitalDF = digitalAllDF.join(itemLocDF, Seq(TCIN, LOCATION_ID), LEFT)
                          .withColumn(PREMIUM_LOCATION_F, lit("N"))
                          .withColumnRenamed(COST_A, ONLINE_COST_A)
                          .drop(itemLocDF(TCIN))
                          .drop(itemLocDF(LOCATION_ID))


    logInfo("Join completed with ItemLoc table")


    val enterpriseDF: DataFrame = {
      // dropping STORE_COST_A, ONLINE_COST_A attributes since we dont need these at item level
      computeEnterpriseRetail(activeILSDF.drop(STORE_COST_A), digitalDF.drop(ONLINE_COST_A))
    }
    logInfo("enterprise_avg_regular_retail_a metrics calculation completed")


    val retailPriceMarketDF = {
      activeILSDF.join(Transformation.filterMarketZonesOnly(marketStateDF), Seq(LOCATION_ID), LEFT)
    }
    logInfo("Join retail and market data completed ")

    val storeMetricDF: DataFrame = {
      MetricCalculator.computeStoreMetrics(retailPriceMarketDF, enterpriseDF)
    }


    val digitalMetricsDF: DataFrame = {
      MetricCalculator.computeDigitalMetrics(digitalDF)
    }

    logInfo("select digital metrics completed")

    coreDF.unpersist()

    val itemMetricsDF: DataFrame = {
      // dropping ONLINE_COST_A attribute since we dont need it at item level
      Transformation.combineStoreDigitalMetrics(storeMetricDF, digitalMetricsDF.drop(ONLINE_COST_A), periodEndDate)
    }

    val (currentDayDF: DataFrame, previousDayDF: DataFrame) = {
      Transformation.prepareCurrentPreviousDayData(
        itemMetricsDF,
        getPreviousDayModeApiData(sparkSession,
          pipeLineConfig.config.getString(ApplicationConstants.APP_EXTERNALDB),
          pipeLineConfig.config.getString(ApplicationConstants.APP_TGT_ITEM_PRICE_EXTERNAL_TABLE), periodEndDate))
    }

    val deltaDF = {
      calculateDelta(currentDayDF, previousDayDF)
        .withColumn(RETAIL_DAY_D, lit(periodEndDate).cast(DateType))
        .select(ApplicationConstants.API_COLUMN_ORDER_FROM_TABLE.map(col):_*)

    }

    logInfo(s"The deltaDF repartition size........ ${deltaDF.rdd.partitions.size} ")

    val itemADSLoadStatus = KelsaUtil.retryWithWait(pipeLineConfig.config.getInt(ApplicationConstants.APP_RETRY_COUNT),SinkServices.writeToItemADSTable(pipeLineConfig
                                                      ,pipeLineConfig.config.getBoolean(ApplicationConstants.APP_WRITE_TO_TABLE)
                                                      ,pipeLineConfig.config.getString(ApplicationConstants.APP_TGT_ITEM_PRICE_EXTERNAL_TABLE)
                                                      ,pipeLineConfig.config.getString(ApplicationConstants.APP_TGT_ITEM_PRICE_EXTERNAL_TABLE_DIR)
                                                      ,deltaDF
                                                      ,pipeLineConfig.config.getInt(ApplicationConstants.COALESCEFACTOR) ),pipeLineConfig.config.getInt(ApplicationConstants.APP_WAIT_TIME))
      logInfo(s"ITEM level ADS load and mode price calculation completed : $itemADSLoadStatus")


    val marketLevelMetricsDF: DataFrame = {
      computeMarketLevelMetrics(retailPriceMarketDF)
    }
    logInfo("get market level metrics completed")


    val baseAndMarketMetrics: DataFrame = {
      Decoration.joinStoreAndMarketMetrics(storeMetricDF, marketLevelMetricsDF)
        .drop(STORE_ITEM_GROUP_N)
        .drop(STORE_ITEM_MEMBERS_PARITY_VALUE)
        .drop(STORE_ITEM_MEMBERS_PARITY_TYPE_N)
        .drop(PRICE_ROUNDING_EXCLUSION_F)
        .drop(STORE_ITEM_GROUP_ID)
    }
    logInfo("join base and market level metrics completed")


    val finalStoreMetricsDF = {
      retailPriceMarketDF.join(baseAndMarketMetrics, Seq(TCIN, GROUP_N), LEFT)
            .drop(baseAndMarketMetrics(GROUP_TYPE_N))
    }

    logInfo("join back with coreDF completed")


    val finalStoreDigitalMetricsDF = {
      finalStoreMetricsDF.join(digitalMetricsDF, finalStoreMetricsDF(TCIN) === digitalMetricsDF("digital_tcin"), LEFT)
    }


    val statesDF: DataFrame = getStateData(marketStateDF)

    marketStateDF.unpersist()


    val statePriceDF = {
      activeILSDF.select(TCIN, LOCATION_ID, REGULAR_RETAIL_A, INTENDED_REGULAR_A).join(statesDF, Seq(LOCATION_ID), LEFT)
    }
    logInfo("Join retail and state data completed ")

    activeILSDF.unpersist()

    val stateMetricsDF = computeStateMetrics(statePriceDF)
    logInfo("state metrics computation completed")

    val allStateMetric = statePriceDF.join(stateMetricsDF, Seq(TCIN, GROUP_N), LEFT)
      .withColumnRenamed(GROUP_N, STATE_N)
    logInfo("join state metrics with state data")


    val allDataDF = finalStoreDigitalMetricsDF.join(allStateMetric, Seq(TCIN, LOCATION_ID), LEFT)
      .drop(allStateMetric(REGULAR_RETAIL_A))
      .drop(allStateMetric(INTENDED_REGULAR_A))
      .withColumnRenamed(REGULAR_RETAIL_A, STORE_REGULAR_RETAIL_A)
      .withColumnRenamed(CURRENT_RETAIL_A, STORE_CURRENT_RETAIL_A)
      .withColumnRenamed(INTENDED_REGULAR_A, STORE_INTENDED_REGULAR_A)
      .select(ApplicationConstants.COLUMN_ORDER.map(col):_*)

    logInfo("stitch state metrics with core data")

      KelsaUtil.retryWithWait(pipeLineConfig.config.getInt(ApplicationConstants.APP_RETRY_COUNT),SinkServices.writeToItemLocPriceADSTable(pipeLineConfig
      ,pipeLineConfig.config.getBoolean(ApplicationConstants.APP_WRITE_TO_TABLE)
      ,pipeLineConfig.config.getString(ApplicationConstants.APP_TGT_ITEM_LOC_EXTERNAL_TABLE)
      ,pipeLineConfig.config.getString(ApplicationConstants.APP_TGT_ITEM_LOC_EXTERNAL_TABLE_DIR)
      ,allDataDF
      ,pipeLineConfig.config.getInt(ApplicationConstants.APP_COALESCE_FACTOR) ),pipeLineConfig.config.getInt(ApplicationConstants.APP_WAIT_TIME))

    logInfo("ITEM_LOC ADS load completed....")

    PipeLineMetadataService.setStringMetricValue(
      ApplicationConstants.DATEOFDATA,
      periodEndDate + " 00:00:00"
    )
    logInfo("Completed all the steps of pipeline successfully .....}"
    )

  }

  /**