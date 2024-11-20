val stg = spark.read.table("stg_priceent_wrk.digital_maps_v2").where("load_d >='2024-07-10'")

val prod = spark.read.table("prd_priceent_fnd.digital_maps").where("load_d >='2024-07-10'")

prod.coalesce(15).write.mode("overwrite").insertInto("stg_priceent_wrk.digital_maps")
prod.select("load_d").distinct.show

stg.coalesce(15).write.mode("overwrite").insertInto("prd_priceent_fnd.digital_maps")

val stg_found = spark.read.table("prd_priceent_fnd.digital_maps").where("load_d ='2024-09-17'")

val stg_fnd = stg_found.withColumn("load_d",lit("2024-09-18"))

val stg_curr = spark.read.table("stg_priceent_wrk.digital_maps_v2").where("load_d ='2024-07-18'")

val uniondf = stg_fnd.unionByName(stg_curr)

val UNIQUE_COLUMN_COMBINATION: Seq[String] = Seq("tcin","competitor_short_name","channel_n")
  val ORDER_BY_COLUMNS: Seq[Column] = Seq(col("update_utc_ts").desc, col("priority_f").desc)

val deDupDF = DeDupHelper.removeDuplicatesWithRank(uniondf,
        UNIQUE_COLUMN_COMBINATION,ORDER_BY_COLUMNS,1,"rank")


val finaldf = deDupDF.drop("rank")
finaldf.count
finaldf.select("load_d").distinct.show
finaldf.coalesce(15).write.mode("overwrite").insertInto("stg_priceent_wrk.digital_maps_v2")

--------------------------------------------------------------------------------------------------------------------------



val specificTimestamp = "2024-07-10 23:00:00"
val currentTimestampInSeconds = deDupDF.withColumn("currentTimestampInSeconds", floor(unix_timestamp(lit(specificTimestamp))))
val secondsIn30Days = 30 * 24 * 60 * 60
val thirtyDaysAgoUTC = currentTimestampInSeconds.withColumn("thirtyDaysAgoUTC", floor(unix_timestamp(lit(specificTimestamp))) - secondsIn30Days)
val event_ts_epoch = thirtyDaysAgoUTC.withColumn("event_ts_epoch",
  unix_timestamp(expr("REPLACE(REPLACE(created_utc_ts, 'T', ' '), 'Z', ' UTC')"))
)


val updatedDF = event_ts_epoch.withColumn("sla_map_days", when(
  col("mapped_status") === "PENDING MAPPING" &&
  (col("competitor_url").isNull || col("competitor_url") === "None") &&
  col("listing_status") === "ACTIVE" &&
  col("event_ts_epoch") <= thirtyDaysAgoUTC, 0)
  .when(
    col("mapped_status") === "PENDING MAPPING" &&
    col("map_flow_status") === "PENDING_OPS" &&
    (col("competitor_url").isNull || col("competitor_url") === "None") &&
    col("listing_status") === "ACTIVE" &&
    col("event_ts_epoch") <= thirtyDaysAgoUTC, 0)
  .otherwise(1))


  val slsdf= updatedDF.withColumn("new_column", when(
  col("mapped_status") === "PENDING MAPPING" &&
  (col("competitor_url").isNull || col("competitor_url") === "None") &&
  col("listing_status") === "ACTIVE" &&
  col("event_ts_epoch") <= thirtyDaysAgoUTC, ceil((currentTimestampInSeconds - col("event_ts_epoch")) / (24 * 60 * 60)))
  .when(
    col("map_flow_status") === "PENDING_OPS" &&
    col("mapped_status") === "PENDING MAPPING" &&
    (col("competitor_url").isNull || col("competitor_url") === "None") &&
    col("listing_status") === "ACTIVE" &&
    col("event_ts_epoch") <= thirtyDaysAgoUTC, ceil((currentTimestampInSeconds - col("event_ts_epoch")) / (24 * 60 * 60)))
  .otherwise(0))

val selectedCols = Seq(
  "channel_n",
  "competitor_short_name",
  "event_n",
  "event_description",
  "audit_status",
  "audited_by",
  "audited_utc_ts",
  "competitor_product_id",
  "competitor_url",
  "created_by",
  "created_utc_ts",
  "event_reason",
  "is_map_attempted",
  "map_audit_comment",
  "map_flow_status",
  "mapped_by",
  "mapped_status",
  "mapped_utc_ts",
  "new_cadence",
  "old_cadence",
  "tcin_competitor_list_id",
  "listing_status",
  "update_by",
  "update_utc_ts",
  "event_utc_ts",
  "source_system",
  "sub_system",
  "tcin",
  "sla_map_days",
  "sla_map_remaining_days",
  "priority_f",
  "load_d"
)

val finalDF = slsdf.select(selectedCols.map(col): _*)
