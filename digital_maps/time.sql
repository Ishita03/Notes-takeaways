val prod = spark.read.table("prd_priceent_fnd.digital_maps").where("load_d ='2024-05-14'")

val prod = spark.read.table("prd_priceent_fnd.digital_maps").where("load_d ='2024-05-14'")
  .where("load_d >= '2024-05-14' AND load_d <= '2024-05-13'")

prod.coalesce(15).write.mode("overwrite").insertInto("stg_priceent_wrk.digital_maps")



val dfWithParsedTimestamp = prod.withColumn("cst_timestamp_parsed", 
to_timestamp(col("mapped_utc_ts"), "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'").cast(TimestampType))

dfWithParsedTimestamp.where("tcin=='52057523'").show(false)

val dfWithUTC = dfWithParsedTimestamp.withColumn("cst_timestamp_parsed",
  to_utc_timestamp(col("cst_timestamp_parsed"), "CST"))

dfWithUTC.where("tcin=='52057523'").show(false)

val dfWithFormattedUTC = dfWithUTC.withColumn("utc_timestamp_formatted",
  date_format(col("cst_timestamp_parsed"), "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'")
).drop("cst_timestamp_parsed")

dfWithFormattedUTC.where("tcin=='52057523'").show(false)


prod.select("channel_n","competitor_short_name","event_n","event_description","audit_status",
 "audited_by","competitor_product_id","competitor_url","created_by","event_reason","is_map_attempted",
 "map_audit_comment","map_flow_status","mapped_by","mapped_status","new_cadence","old_cadence",
 "tcin_competitor_list_id","listing_status","update_by" ,"update_utc_ts","event_utc_ts","source_system","sub_system",
 "tcin","sla_map_days","sla_map_remaining_days","load_d").except(dfWithFormattedUTC.select(""channel_n","competitor_short_name","event_n","event_description","audit_status",
 "audited_by","competitor_product_id","competitor_url","created_by","event_reason","is_map_attempted",
 "map_audit_comment","map_flow_status","mapped_by","mapped_status","new_cadence","old_cadence",
 "tcin_competitor_list_id","listing_status","update_by" ,"update_utc_ts","event_utc_ts","source_system","sub_system",
 "tcin","sla_map_days","sla_map_remaining_days","load_d"))

dfWithFormattedUTC.coalesce(15).write.mode("overwrite").insertInto("stg_priceent_wrk.digital_maps_v2")

val dfWithUTC = df
      .withColumn("utcTimestamp", date_format(
        to_utc_timestamp($"cstTimestamp", "CST"),
        "yyyy-MM-dd HH:mm:ss.SSSSSS 'UTC'")
      )

date_format(to_timestamp(audited_utc_ts, 'yyyy-MM-dd HH:mm:ss.SSSSSS zzz'), 'yyyy-MM-dd\'T\'HH:mm:ss.SSSSSS\'Z\'')

 val dfWithOriginalFormat = df
      .withColumn("original_ts", date_format(
        from_utc_timestamp(
          to_timestamp($"mappedTimestamp", "yyyy-MM-dd HH:mm:ss.SSSSSS zzz"), "CST"), 
        "yyyy-MM-dd HH:mm:ss.SSSSSS zzz")
      )

convertedfinal.coalesce(20).write.format("orc").mode("overwrite").insertInto("stg_priceent_wrk.digital_maps_v2")


