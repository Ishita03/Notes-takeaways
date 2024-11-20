writeToItemLocPriceADSTable  --->allDataDF

 val allDataDF = finalStoreDigitalMetricsDF.join(allStateMetric, Seq(TCIN, LOCATION_ID), LEFT)
      .drop(allStateMetric(REGULAR_RETAIL_A))
      .drop(allStateMetric(INTENDED_REGULAR_A))
      .withColumnRenamed(REGULAR_RETAIL_A, STORE_REGULAR_RETAIL_A)
      .withColumnRenamed(CURRENT_RETAIL_A, STORE_CURRENT_RETAIL_A)
      .withColumnRenamed(INTENDED_REGULAR_A, STORE_INTENDED_REGULAR_A)
      .select(ApplicationConstants.COLUMN_ORDER.map(col):_*)