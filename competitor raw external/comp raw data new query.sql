--Manual load insert for competitor raw data table from managed to external

INSERT OVERWRITE TABLE stg_priceent_fnd.competitor_raw_data_tmp
partition (shop_crawl_week_end_d, derived_chain_n)
SELECT 
vendor_provided_store_id  
  , vendor_provided_export_product_id  
  , banner_n 
  , banner_id  
  , channel_method_n 
  , country_n  
  , shop_create_utc_ts  
  , vendor_provided_result_id  
  , export_id  
  , host_n  
  , in_stock_f  
  , price_0_clearance_f 
  , price_0_reduced_f  
  , price_0_currency_c  
  , price_0_end_d
  , price_0_in_store_price_f  
  , price_0_loyalty_f  
  , price_0_membership_f  
  , price_0_multiple_q  
  , price_0_price_a  
  , price_0_promotion_f  
  , price_0_rollback_f  
  , price_0_sold_per_unit_f  
  , price_0_start_d  
  , price_0_unit_price_a  
  , price_0_unit_price_multiple_q  
  , price_0_unit_price_uom  
  , price_1_clearance_f  
  , price_1_reduced_f  
  , price_1_currency_c  
  , price_1_end_d  
  , price_1_in_store_price_f  
  , price_1_loyalty_f  
  , price_1_membership_f  
  , price_1_multiple_q  
  , price_1_price_a  
  , price_1_promotion_f  
  , price_1_rollback_f  
  , price_1_sold_per_unit_f  
  , price_1_start_d  
  , price_1_unit_price_a  
  , price_1_unit_price_multiple_q  
  , price_1_unit_price_uom  
  , regular_retail_a 
  , offer_retail_a 
  , anomalous_price_f 
  , store_id  
  , store_inferred_f  
  , surrogate_product_id  
  , additional_product_desc  
  , brand_n  
  , category_level_0  
  , category_level_1  
  , category_level_2  
  , count_q  
  , count_units_n  
  , vendor_provided_product_id  
  , product_desc  
  , dpci  
  , vendor_provided_brand_n  
  , vendor_provided_category_level_0  
  , vendor_provided_category_level_1  
  , vendor_provided_desc 
  , vendor_provided_size_q  
  , vendor_provided_size_units_n  
  , image_url 
  , pack_count_q 
  , pack_count_units_n  
  , product_type_t  
  , size_q  
  , size_t  
  , size_uom  
  , sku  
  , tcin  
  , chain_n
  , upc  
  , address_t  
  , city_n 
  , latitude  
  , longitude  
  , postal_c  
  , state_c  
  , status_f  
  , store_number  
  , updated_d   
  , shop_crawl_d 
  , next_day(date_sub(shop_crawl_d, 1), 'SAT') as shop_crawl_week_end_d 
  , CASE WHEN chain_n = 'WALMART' THEN chain_n ELSE 'OTHER' END AS derived_chain_n   
  FROM prd_priceent_fnd.competitor_raw_data 
  where shop_crawl_d >= date_add(current_date, -7);


  -----------

INSERT INTO TABLE stg_priceent_fnd.competitor_raw_data_tmp
partition (shop_crawl_week_end_d, derived_chain_n)
  SELECT 
vendor_provided_store_id  
  , vendor_provided_export_product_id  
  , banner_n 
  , banner_id  
  , channel_method_n 
  , country_n  
  , shop_create_utc_ts  
  , vendor_provided_result_id  
  , export_id  
  , host_n  
  , in_stock_f  
  , price_0_clearance_f 
  , price_0_reduced_f  
  , price_0_currency_c  
  , price_0_end_d
  , price_0_in_store_price_f  
  , price_0_loyalty_f  
  , price_0_membership_f  
  , price_0_multiple_q  
  , price_0_price_a  
  , price_0_promotion_f  
  , price_0_rollback_f  
  , price_0_sold_per_unit_f  
  , price_0_start_d  
  , price_0_unit_price_a  
  , price_0_unit_price_multiple_q  
  , price_0_unit_price_uom  
  , price_1_clearance_f  
  , price_1_reduced_f  
  , price_1_currency_c  
  , price_1_end_d  
  , price_1_in_store_price_f  
  , price_1_loyalty_f  
  , price_1_membership_f  
  , price_1_multiple_q  
  , price_1_price_a  
  , price_1_promotion_f  
  , price_1_rollback_f  
  , price_1_sold_per_unit_f  
  , price_1_start_d  
  , price_1_unit_price_a  
  , price_1_unit_price_multiple_q  
  , price_1_unit_price_uom  
  , regular_retail_a 
  , offer_retail_a 
  , anomalous_price_f 
  , store_id  
  , store_inferred_f  
  , surrogate_product_id  
  , additional_product_desc  
  , brand_n  
  , category_level_0  
  , category_level_1  
  , category_level_2  
  , count_q  
  , count_units_n  
  , vendor_provided_product_id  
  , product_desc  
  , dpci  
  , vendor_provided_brand_n  
  , vendor_provided_category_level_0  
  , vendor_provided_category_level_1  
  , vendor_provided_desc 
  , vendor_provided_size_q  
  , vendor_provided_size_units_n  
  , image_url 
  , pack_count_q 
  , pack_count_units_n  
  , product_type_t  
  , size_q  
  , size_t  
  , size_uom  
  , sku  
  , tcin  
  , chain_n
  , upc  
  , address_t  
  , city_n 
  , latitude  
  , longitude  
  , postal_c  
  , state_c  
  , status_f  
  , store_number  
  , updated_d   
  , shop_crawl_d 
  , next_day(date_sub(shop_crawl_d, 1), 'SAT') as shop_crawl_week_end_d 
  , CASE WHEN chain_n = 'WALMART' THEN chain_n ELSE 'OTHER' END AS derived_chain_n   
  FROM prd_priceent_fnd.competitor_raw_data 
WHERE shop_crawl_d >= date_sub((SELECT MIN(shop_crawl_d) FROM stg_priceent_fnd.competitor_raw_data_tmp), 7) 
  AND shop_crawl_d < (SELECT MIN(shop_crawl_d) FROM stg_priceent_fnd.competitor_raw_data_tmp)


  -------
SET hivevar:min_shop_crawl_d=(SELECT MIN(shop_crawl_d) FROM stg_priceent_fnd.competitor_raw_data_tmp);

INSERT INTO TABLE stg_priceent_fnd.competitor_raw_data_tmp
partition (shop_crawl_week_end_d, derived_chain_n)
  SELECT 
vendor_provided_store_id  
  , vendor_provided_export_product_id  
  , banner_n 
  , banner_id  
  , channel_method_n 
  , country_n  
  , shop_create_utc_ts  
  , vendor_provided_result_id  
  , export_id  
  , host_n  
  , in_stock_f  
  , price_0_clearance_f 
  , price_0_reduced_f  
  , price_0_currency_c  
  , price_0_end_d
  , price_0_in_store_price_f  
  , price_0_loyalty_f  
  , price_0_membership_f  
  , price_0_multiple_q  
  , price_0_price_a  
  , price_0_promotion_f  
  , price_0_rollback_f  
  , price_0_sold_per_unit_f  
  , price_0_start_d  
  , price_0_unit_price_a  
  , price_0_unit_price_multiple_q  
  , price_0_unit_price_uom  
  , price_1_clearance_f  
  , price_1_reduced_f  
  , price_1_currency_c  
  , price_1_end_d  
  , price_1_in_store_price_f  
  , price_1_loyalty_f  
  , price_1_membership_f  
  , price_1_multiple_q  
  , price_1_price_a  
  , price_1_promotion_f  
  , price_1_rollback_f  
  , price_1_sold_per_unit_f  
  , price_1_start_d  
  , price_1_unit_price_a  
  , price_1_unit_price_multiple_q  
  , price_1_unit_price_uom  
  , regular_retail_a 
  , offer_retail_a 
  , anomalous_price_f 
  , store_id  
  , store_inferred_f  
  , surrogate_product_id  
  , additional_product_desc  
  , brand_n  
  , category_level_0  
  , category_level_1  
  , category_level_2  
  , count_q  
  , count_units_n  
  , vendor_provided_product_id  
  , product_desc  
  , dpci  
  , vendor_provided_brand_n  
  , vendor_provided_category_level_0  
  , vendor_provided_category_level_1  
  , vendor_provided_desc 
  , vendor_provided_size_q  
  , vendor_provided_size_units_n  
  , image_url 
  , pack_count_q 
  , pack_count_units_n  
  , product_type_t  
  , size_q  
  , size_t  
  , size_uom  
  , sku  
  , tcin  
  , chain_n
  , upc  
  , address_t  
  , city_n 
  , latitude  
  , longitude  
  , postal_c  
  , state_c  
  , status_f  
  , store_number  
  , updated_d   
  , shop_crawl_d 
  , next_day(date_sub(shop_crawl_d, 1), 'SAT') as shop_crawl_week_end_d 
  ,CASE WHEN trim(upper(chain_n)) = 'WALMART' THEN trim(upper(chain_n)) ELSE 'OTHER' END AS derived_chain_n   
  FROM prd_priceent_fnd.competitor_raw_data 
WHERE shop_crawl_d >= date_sub(${min_shop_crawl_d}, 7)
  AND shop_crawl_d < ${min_shop_crawl_d}


  ------------


SET hivevar:min_shop_crawl_d=(SELECT MIN(shop_crawl_d) FROM stg_priceent_fnd.competitor_raw_data_tmp);

INSERT INTO DIRECTORY 'hdfs://user/SVPRIHDS/hive/competitor_raw_data_stg'
partition (shop_crawl_week_end_d, derived_chain_n)
  SELECT 
vendor_provided_store_id  
  , vendor_provided_export_product_id  
  , banner_n 
  , banner_id  
  , channel_method_n 
  , country_n  
  , shop_create_utc_ts  
  , vendor_provided_result_id  
  , export_id  
  , host_n  
  , in_stock_f  
  , price_0_clearance_f 
  , price_0_reduced_f  
  , price_0_currency_c  
  , price_0_end_d
  , price_0_in_store_price_f  
  , price_0_loyalty_f  
  , price_0_membership_f  
  , price_0_multiple_q  
  , price_0_price_a  
  , price_0_promotion_f  
  , price_0_rollback_f  
  , price_0_sold_per_unit_f  
  , price_0_start_d  
  , price_0_unit_price_a  
  , price_0_unit_price_multiple_q  
  , price_0_unit_price_uom  
  , price_1_clearance_f  
  , price_1_reduced_f  
  , price_1_currency_c  
  , price_1_end_d  
  , price_1_in_store_price_f  
  , price_1_loyalty_f  
  , price_1_membership_f  
  , price_1_multiple_q  
  , price_1_price_a  
  , price_1_promotion_f  
  , price_1_rollback_f  
  , price_1_sold_per_unit_f  
  , price_1_start_d  
  , price_1_unit_price_a  
  , price_1_unit_price_multiple_q  
  , price_1_unit_price_uom  
  , regular_retail_a 
  , offer_retail_a 
  , anomalous_price_f 
  , store_id  
  , store_inferred_f  
  , surrogate_product_id  
  , additional_product_desc  
  , brand_n  
  , category_level_0  
  , category_level_1  
  , category_level_2  
  , count_q  
  , count_units_n  
  , vendor_provided_product_id  
  , product_desc  
  , dpci  
  , vendor_provided_brand_n  
  , vendor_provided_category_level_0  
  , vendor_provided_category_level_1  
  , vendor_provided_desc 
  , vendor_provided_size_q  
  , vendor_provided_size_units_n  
  , image_url 
  , pack_count_q 
  , pack_count_units_n  
  , product_type_t  
  , size_q  
  , size_t  
  , size_uom  
  , sku  
  , tcin  
  , chain_n
  , upc  
  , address_t  
  , city_n 
  , latitude  
  , longitude  
  , postal_c  
  , state_c  
  , status_f  
  , store_number  
  , updated_d   
  , shop_crawl_d 
  , next_day(date_sub(shop_crawl_d, 1), 'SAT') as shop_crawl_week_end_d 
  ,CASE WHEN trim(upper(chain_n)) = 'WALMART' THEN trim(upper(chain_n)) ELSE 'OTHER' END AS derived_chain_n   
  FROM prd_priceent_fnd.competitor_raw_data 
WHERE shop_crawl_d >= date_sub(${min_shop_crawl_d}, 7)
  AND shop_crawl_d < ${min_shop_crawl_d}

  --------

set tez.queue.name=SVPRIHDP;
    -------

SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;
set spark.hadoop.hive.exec.dynamic.partition=true;
set spark.hadoop.hive.exec.dynamic.partition.mode = nonstrict;


INSERT INTO TABLE stg_priceent_fnd.competitor_raw_data_tmp
PARTITION (shop_crawl_week_end_d, derived_chain_n)
  SELECT 
vendor_provided_store_id  
  , vendor_provided_export_product_id  
  , banner_n 
  , banner_id  
  , channel_method_n 
  , country_n  
  , shop_create_utc_ts  
  , vendor_provided_result_id  
  , export_id  
  , host_n  
  , in_stock_f  
  , price_0_clearance_f 
  , price_0_reduced_f  
  , price_0_currency_c  
  , price_0_end_d
  , price_0_in_store_price_f  
  , price_0_loyalty_f  
  , price_0_membership_f  
  , price_0_multiple_q  
  , price_0_price_a  
  , price_0_promotion_f  
  , price_0_rollback_f  
  , price_0_sold_per_unit_f  
  , price_0_start_d  
  , price_0_unit_price_a  
  , price_0_unit_price_multiple_q  
  , price_0_unit_price_uom  
  , price_1_clearance_f  
  , price_1_reduced_f  
  , price_1_currency_c  
  , price_1_end_d  
  , price_1_in_store_price_f  
  , price_1_loyalty_f  
  , price_1_membership_f  
  , price_1_multiple_q  
  , price_1_price_a  
  , price_1_promotion_f  
  , price_1_rollback_f  
  , price_1_sold_per_unit_f  
  , price_1_start_d  
  , price_1_unit_price_a  
  , price_1_unit_price_multiple_q  
  , price_1_unit_price_uom  
  , regular_retail_a 
  , offer_retail_a 
  , anomalous_price_f 
  , store_id  
  , store_inferred_f  
  , surrogate_product_id  
  , additional_product_desc  
  , brand_n  
  , category_level_0  
  , category_level_1  
  , category_level_2  
  , count_q  
  , count_units_n  
  , vendor_provided_product_id  
  , product_desc  
  , dpci  
  , vendor_provided_brand_n  
  , vendor_provided_category_level_0  
  , vendor_provided_category_level_1  
  , vendor_provided_desc 
  , vendor_provided_size_q  
  , vendor_provided_size_units_n  
  , image_url 
  , pack_count_q 
  , pack_count_units_n  
  , product_type_t  
  , size_q  
  , size_t  
  , size_uom  
  , sku  
  , tcin  
  , chain_n
  , upc  
  , address_t  
  , city_n 
  , latitude  
  , longitude  
  , postal_c  
  , state_c  
  , status_f  
  , store_number  
  , updated_d   
  , shop_crawl_d 
  , next_day(date_sub(shop_crawl_d, 1), 'SAT') as shop_crawl_week_end_d 
  ,CASE WHEN trim(upper(chain_n)) = 'WALMART' THEN trim(upper(chain_n)) ELSE 'OTHER' END AS derived_chain_n   
  FROM prd_priceent_fnd.competitor_raw_data 
WHERE shop_crawl_d >= date_sub('2023-05-07', 2) AND shop_crawl_d < '2023-05-07'


------------------------------------------------


#!/bin/bash

# Get the historic date
current_date=$(date +%Y-%m-%d)

# Calculate the start date by subtracting 3 months from the current date
start_date=$(date -d "$current_date - 1 months" +%Y-%m-%d)

# Set the iteration period to 7 days
iteration_period=7

# Loop through the dates in iterations of 7 days
while [[ "$start_date" < "$current_date" ]]; do
  # Calculate the end date by adding 6 days to the start date
  end_date=$(date -d "$start_date + 6 days" +%Y-%m-%d)

  # Generate the Hive SQL statement to load data for the current iteration
  hive_query="INSERT INTO TABLE stg_priceent_fnd.competitor_raw_data_tmp
PARTITION (shop_crawl_week_end_d, derived_chain_n)
  SELECT 
vendor_provided_store_id  
  , vendor_provided_export_product_id  
  , banner_n 
  , banner_id  
  , channel_method_n 
  , country_n  
  , shop_create_utc_ts  
  , vendor_provided_result_id  
  , export_id  
  , host_n  
  , in_stock_f  
  , price_0_clearance_f 
  , price_0_reduced_f  
  , price_0_currency_c  
  , price_0_end_d
  , price_0_in_store_price_f  
  , price_0_loyalty_f  
  , price_0_membership_f  
  , price_0_multiple_q  
  , price_0_price_a  
  , price_0_promotion_f  
  , price_0_rollback_f  
  , price_0_sold_per_unit_f  
  , price_0_start_d  
  , price_0_unit_price_a  
  , price_0_unit_price_multiple_q  
  , price_0_unit_price_uom  
  , price_1_clearance_f  
  , price_1_reduced_f  
  , price_1_currency_c  
  , price_1_end_d  
  , price_1_in_store_price_f  
  , price_1_loyalty_f  
  , price_1_membership_f  
  , price_1_multiple_q  
  , price_1_price_a  
  , price_1_promotion_f  
  , price_1_rollback_f  
  , price_1_sold_per_unit_f  
  , price_1_start_d  
  , price_1_unit_price_a  
  , price_1_unit_price_multiple_q  
  , price_1_unit_price_uom  
  , regular_retail_a 
  , offer_retail_a 
  , anomalous_price_f 
  , store_id  
  , store_inferred_f  
  , surrogate_product_id  
  , additional_product_desc  
  , brand_n  
  , category_level_0  
  , category_level_1  
  , category_level_2  
  , count_q  
  , count_units_n  
  , vendor_provided_product_id  
  , product_desc  
  , dpci  
  , vendor_provided_brand_n  
  , vendor_provided_category_level_0  
  , vendor_provided_category_level_1  
  , vendor_provided_desc 
  , vendor_provided_size_q  
  , vendor_provided_size_units_n  
  , image_url 
  , pack_count_q 
  , pack_count_units_n  
  , product_type_t  
  , size_q  
  , size_t  
  , size_uom  
  , sku  
  , tcin  
  , chain_n
  , upc  
  , address_t  
  , city_n 
  , latitude  
  , longitude  
  , postal_c  
  , state_c  
  , status_f  
  , store_number  
  , updated_d   
  , shop_crawl_d 
  , next_day(date_sub(shop_crawl_d, 1), 'SAT') as shop_crawl_week_end_d 
  ,CASE WHEN trim(upper(chain_n)) = 'WALMART' THEN trim(upper(chain_n)) ELSE 'OTHER' END AS derived_chain_n   
  FROM prd_priceent_fnd.competitor_raw_data 
   WHERE shop_crawl_d BETWEEN '$start_date' AND '$end_date';"

  # Execute the Hive SQL statement
  hive -e "$hive_query"

  # Increment the start date by the iteration period
  start_date=$(date -d "$start_date + $iteration_period days" +%Y-%m-%d)
done
