create external table stg_priceent_fnd.competitor_raw_data_test(
    vendor_provided_store_id  string COMMENT 'Unique identifier created for store locations by source team. This is used to join productlisting/result DSB files with Stores files.Sample Values : 0183befb-5613-3154-bfd0-530d124155f9,020d464d-a0bb-3a9b-961a-d84f146f4227'
  , vendor_provided_export_product_id  string COMMENT 'Unique identifier created for items by source team. This is used to join productlisting/result DSB files with Product files.Sample Values : b93d69ed-9f67-3170-8f24-94a64e5ac248,87289b85-dc8b-3924-9859-8930e11ab7ef'
  , banner_n  string COMMENT 'This is the brand name of the retailer at this location. For example, the Kroger chain operates stores under the banners King Soopers, Kroger, Frys Food, etc. Sample Values : WALMART,DOLLAR GENERAL,MEIJER'
  , banner_id  string COMMENT 'Unique identifier of a banner. A banner is also uniquely identified by the combination of chain and banner. This is a Datasembly identifier. Sample values :c624d14db3124e13a8cf080171cb50f3,714bc76991314f7993e07fbbcb12782d'
  , channel_method_n  string COMMENT 'Method by which the product is provided to the customer. Possible values are: instore, pickup, localdelivery, and ecommerce'
  , country_n  string COMMENT 'Country where the listing is located. Defaults to USA if not provided. Sample Values : US'
  , shop_create_utc_ts  timestamp COMMENT 'Timestamp which indicates when the shopping signal was captured. Sample Values : 2022-04-18 22:46:55.071,2022-04-18 21:50:40.106'
  , vendor_provided_result_id  string COMMENT 'Unique identifier created for competitor price signals by source team. This will be unique and different for all item locations every week.Sample Values : d0c92914-915a-3587-a19f-1f00457e86d7,5753660b-cdda-300a-8b65-227fd3e192f7'
  , export_id  string COMMENT 'Unique Identifier for every weeks load/export. This will be same for all signals in the same week but will be different for different week. Sample values : 12117,12118'
  , host_n  string COMMENT 'This indicates the domain of the host from which the data was collected (e.g. www.walmart.com, grocery.walmart.com, www.kroger.com, etc.)'
  , in_stock_f  boolean COMMENT 'Flag which indicates if the item is available and in stock in the competitor store. Sample values : true,false'
  , price_0_clearance_f  boolean COMMENT 'This flag indicates if the price is clearance price. This will be true if the price is clearance price.  Sample values : true,false'
  , price_0_reduced_f  boolean COMMENT 'This flag indicates if the price is strikeout/reduced price. This will be true if the price is strikeout/reduced price.  Sample values : true,false'
  , price_0_currency_c  string COMMENT 'Currency of the price value of the competitor signal captured.Sample values : USD,CAD'
  , price_0_end_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_0_in_store_price_f  boolean COMMENT 'This flag indicates if the price is same as in-store price. This will be true if the price is same.  Sample values : true,false'
  , price_0_loyalty_f  boolean COMMENT 'This flag indicates if the price is available through a loyalty program. This will be true if the price is based on loyalty program.  Sample values : true,false'
  , price_0_membership_f  boolean COMMENT 'This flag indicates if the price is for customers through a membership account. This will be true if the price is based on membership program.  Sample values : true,false'
  , price_0_multiple_q  double COMMENT 'Multiple component of the price (e.g. 2 in 2 for $5). The each price can be calculated by dividing the price by the multiple (e.g. 2 for $5 ? $2.50 each). Assume 1 if null'
  , price_0_price_a  double COMMENT 'Price component of the competitor item. Sample values : 5.99,1.99'
  , price_0_promotion_f  boolean COMMENT 'This flag indicates if the price is same as promotional price. This will be true if the price is promo price. Sample values : true,false'
  , price_0_rollback_f  boolean COMMENT 'This flag indicates if the price is rollback price. This will be true if the price is rollback price.This applies only to data collected from Walmart hosts. Sample values : true,false'
  , price_0_sold_per_unit_f  boolean COMMENT 'This will be True if this price is sold by a variable unit (e.g. pounds, ounces, inches, etc.). Sample values : true,false'
  , price_0_start_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_0_unit_price_a  double COMMENT 'This indicates the price component of the unit price (e.g. 2.55 in $2.55 / lb) for the competitor item. Sample values : 5.37,0.077'
  , price_0_unit_price_multiple_q  double COMMENT 'This indicates the Unit multiple (e.g. 1.5 in $5.00 / 1.5 lbs) for the competitor item. Assume 1 if null'
  , price_0_unit_price_uom  string COMMENT 'This indicates the Unit of measure of the unit price (e.g. lbs in $2.55 / lb) for the competitor item. Sample values : ounce,fluid ounce'
  , price_1_clearance_f  string COMMENT 'This flag indicates if the price is clearance price. This will be true if the price is clearance price.  Sample values : true,false'
  , price_1_reduced_f  boolean COMMENT 'This flag indicates if the price is strikeout/reduced price. This will be true if the price is strikeout/reduced price.  Sample values : true,false'
  , price_1_currency_c  string COMMENT 'Currency of the price value of the competitor signal captured.Sample values : USD,CAD'
  , price_1_end_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_1_in_store_price_f  boolean COMMENT 'This flag indicates if the price is same as in-store price. This will be true if the price is same.  Sample values : true,false'
  , price_1_loyalty_f  boolean COMMENT 'This flag indicates if the price is available through a loyalty program. This will be true if the price is based on loyalty program.  Sample values : true,false'
  , price_1_membership_f  boolean COMMENT 'This flag indicates if the price is for customers through a membership account. This will be true if the price is based on membership program.  Sample values : true,false'
  , price_1_multiple_q  double COMMENT 'Multiple component of the price (e.g. 2 in 2 for $5). The each price can be calculated by dividing the price by the multiple (e.g. 2 for $5 ? $2.50 each). Assume 1 if null'
  , price_1_price_a  double COMMENT 'Price component of the competitor item. Sample values : 5.99,8.49'
  , price_1_promotion_f  boolean COMMENT 'This flag indicates if the price is same as promotional price. This will be true if the price is promo price. Sample values : true,false'
  , price_1_rollback_f  boolean COMMENT 'This flag indicates if the price is rollback price. This will be true if the price is rollback price.This applies only to data collected from Walmart hosts. Sample values : true,false'
  , price_1_sold_per_unit_f  boolean COMMENT 'This will be True if this price is sold by a variable unit (e.g. pounds, ounces, inches, etc.). Sample values : true,false'
  , price_1_start_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_1_unit_price_a  string COMMENT 'This indicates the price component of the unit price (e.g. 2.55 in $2.55 / lb) for the competitor item. Sample values : 5.37,0.077'
  , price_1_unit_price_multiple_q  string COMMENT 'This indicates the Unit multiple (e.g. 1.5 in $5.00 / 1.5 lbs) for the competitor item. Assume 1 if null'
  , price_1_unit_price_uom  string COMMENT 'This indicates the Unit of measure of the unit price (e.g. lbs in $2.55 / lb) for the competitor item. Sample values : ounce,fluid ounce'
  , regular_retail_a double COMMENT 'This is the regular retail amount of the competitor item calculated using price_1 and price_0 flags.Sample values : 19.98,5.98'
  , offer_retail_a double COMMENT 'This is the offer retail amount of the competitor item calculated using price_1 and price_0 flags.Sample values : 14.98,2.98'
  , anomalous_price_f boolean COMMENT 'This flag indicates if the price points are far off from the average price points of the item across different locations, in a given week.Sample values : true,false'
  , store_id  string COMMENT 'Unique identifier of a store. This is a Datasembly identifier and should be used to connect product listings to stores. Sample values : 9278abe36f754cfca1eeed831bf023f2,7d7419aba6a846ef89c21080ce88d123,6798a298156c48819cc39911c0df644c'
  , store_inferred_f  boolean COMMENT 'This will be True if the store is inferred from the banner and postal code. This marks data where the store was not provided on the site (often because it uses a shop by postal code system) but we are confident that the listings match the in store listings. Sample values : true,false'
  , surrogate_product_id  string COMMENT 'Surrogate ID is a unique identifier for a product. All surrogate IDs are only valid within the same export and are not stable across exports. This can be used to join to products.Sample values : c93f2ca406afa44aca1262bfe3a77002,3f8b06bdf65d8ad28c06088d58dd9b6d'
  , additional_product_desc  string COMMENT 'Full description captured from the source for the competitor item. Ex : You cant beat an original, especially when its as smooth, creamy and delicious as Yoplait. Its Low Fat, Gluten Free and has No High Fructose Corn Syrup, No Artificial Flavors or No Colors From Artificial Sources'
  , brand_n  string COMMENT 'Name of the products brand as listed by the seller. Sample values : MARKETSIDE,YOPLAIT,FAIRLIFE'
  , category_level_0  string COMMENT 'Top level category of the item as listed by the seller. Sample values : Food,Health,Office & School Supplies'
  , category_level_1  string COMMENT 'Second level category of the item as listed by the seller. Sample values : Dairy & Eggs,Meat & Seafood,Medicine Cabinet'
  , category_level_2  string COMMENT 'Third level category of the item as listed by the seller. Sample values : Yogurt,Chicken,Milk, Cough Cold & Flu'
  , count_q  string COMMENT 'Total no of unit items present in one pack of competitor item.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is 216. Sample values : 16.0,4.0'
  , count_units_n  string COMMENT 'Unit of measure for the above count_q attribute.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is count. Sample values : count'
  , vendor_provided_product_id  string COMMENT 'Unique identifier created for items by source team. This is used to join productlisting/result DSB files with Product files.Sample Values : 924d1612-c5c2-3574-b53f-19804879efe0,993cd00b-83cf-302f-8616-97f7ee362e9b'
  , product_desc  string COMMENT 'Products description of the competitor item as listed by the seller. Sample values  : Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct,Johnsonville Sausage Strips Original, 12 Count, 12 oz '
  , dpci  string COMMENT 'Item Identifier which is a combination of department,class and item ids in ddd-cc-iiii format.Sample values : 049-09-0228,231-15-0795,003-07-0142'
  , vendor_provided_brand_n  string COMMENT 'Name of the products brand. Provided from the Datasembly taxonomy where available. Sample values:  MARKETSIDE,YOPLAIT,FAIRLIFE'
  , vendor_provided_category_level_0  string COMMENT 'Top level category of the item provided from the Datasembly taxonomy where available. Sample values: Food,Health,Office & School Supplies'
  , vendor_provided_category_level_1  string COMMENT 'Second level category of the item provided from the Datasembly taxonomy where available. Sample values: Dairy & Eggs,Meat & Seafood,Medicine Cabinet'
  , vendor_provided_desc  string COMMENT 'Products description. Provided from the Datasembly taxonomy where available. Sample values: Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct,Johnsonville Sausage Strips Original, 12 Count, 12 oz'
  , vendor_provided_size_q  string COMMENT 'Numeric size of the product. Provided from the Datasembly taxonomy where available. Sample values: 32.0,52.0'
  , vendor_provided_size_units_n  string COMMENT 'Size units of the product. Provided from the Datasembly taxonomy where available. Sample values: ounce,pound,fluid ounce'
  , image_url  string COMMENT 'Image url of the competitor item scrapped from the competitor website/store. Sample values : https://i5.walmartimages.com/asr/57608d77-af57-4483-96fe-1652e4af7ed1.0c460c2ec841bc5d86175743de3173f7.jpeg'
  , pack_count_q  double COMMENT 'Total no of packs present in competitor item.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is 3. Sample values : 16.0,4.0,3.0'
  , pack_count_units_n  string COMMENT 'Unit of measure for the above pack_count_q attribute.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is pack. Sample values : count'
  , product_type_t  string COMMENT 'Product type of the item. Sample values : Yogurts,Chicken,Milks'
  , size_q  double COMMENT 'Numeric size of the product. Taken directly from the seller if listed numerically or extracted from the size_text where possible. Sample values : 32.0,52.0'
  , size_t  string COMMENT 'Products size as listed by the seller.Sample values :  0.5 [lb_av],1.89 [lb_av]'
  , size_uom  string COMMENT 'Size units of the product (e.g. ounce, inch, etc.). Taken directly from the seller if listed with enumerable unit names or extracted from the size_text where possible.Sample values : ounce,pound,fluid ounce'
  , sku  string COMMENT 'This is the Retailers SKU code of the product. Uniquely identifies a product at a specific banner. Sample values : 371202137,913548604'
  , tcin  string COMMENT 'Uniquely identifiable item number. This helps in joining the item tables to get other attributes like items description,metadata etc.Sample values: 82371355, 82371234, 82371358 etc.'
  , chain_n  string COMMENT 'This is the chain name of the retailer at this location. For example, the Kroger chain operates stores under the banners King Soopers, Kroger, Frys Food, etc. Sample Values : WALMART,DOLLAR GENERAL,MEIJER'
  , upc  string COMMENT 'This is universal product code of the item and can be used as item identifier.Sample values : 47701002773,762111204707,44600313719'
  , address_t  string COMMENT 'This indicates the address of the competitor location.Example values: 7150 Gale Ave,455 Elk Grove Blvd,14865 Telegraph Road,490 RODRIGUEZ ST'
  , city_n  string COMMENT 'This indicates the city of the competitor location.Example values: Elk Grove,Hacienda Heights,WATSONVILLE,LA MIRADA'
  , latitude  string COMMENT 'This gives the latitude coordinate of the competitors geographic location.Example values: 33.998396,38.410207'
  , longitude  string COMMENT 'This gives the longitude coordinate of the competitors geographic location.Example values: -121.39202,-117.93236'
  , postal_c  string COMMENT 'Postal code where the listing is located. This is always present when a store_id is not present, but it is only sometimes present when a store_id is provided. Sample values : 95076,90638,43228,28504'
  , state_c  string COMMENT 'This indicates the state_code of the competitor store/location.Example values: CA,TX,NC,OH'
  , status_f  boolean COMMENT 'This indicates whether the store was operational as of last time the stores data was updated.Sample values : true,false'
  , store_number  string COMMENT 'Store number assigned to the store by the banner. This is the numeric version of the store id and can be used to join to other competitor location related tables.Sample Values : 5661,9796,104,10935'
  , updated_d  string COMMENT 'This indicates when the store was operational as of last time the stores data was updated.Sample values : 2022-04-17,2022-04-10'
  , shop_crawl_d  date  COMMENT 'This indicates the day this listing was observed and is also the partition column of the dataset Sample Values : 2022-04-17,2021-01-01'
   )
PARTITIONED BY (shop_crawl_week_end_d date ,derived_chain_n string)
stored as orc
LOCATION '/user/SVPRIHDS/hive/competitor_raw_data_stg_test'
TBLPROPERTIES ( 'ORC.COMPRESS'='SNAPPY');

--hdfs://bigred3ns/user/SVPRIHDS/hive/competitor_raw_data_stg


hdfs dfs -setfacl -m user:SVPRICTLHDP:rwx /user/SVPRIHDS/hive/competitor_raw_data_stg


derived_chain_n ----> new col (new partition)

INSERT OVERWRITE TABLE stg_priceent_fnd.competitor_raw_data_tmp
partition (shop_crawl_week_end_d, chain_n)
SELECT t1.*, t2.FISCAL_WEEK_END_D as shop_crawl_week_end_d
FROM prd_priceent_fnd.competitor_raw_data t1
JOIN prd_cal_fnd.calendar t2
ON t1.shop_crawl_d = t2.CALENDAR_D;
where shop_crawl_d >= date_add(current_date, -7);



// order as per table 

INSERT OVERWRITE TABLE stg_priceent_fnd.competitor_raw_data_tmp
partition (shop_crawl_week_end_d, chain_n)
SELECT *,  next_day(date_sub(shop_crawl_d, 1), 'SAT') as shop_crawl_week_end_d
FROM prd_priceent_fnd.competitor_raw_data 
where shop_crawl_d >= date_add(current_date, -7);

---application_1683218337473_393943
/*+ BROADCASTJOIN(small_table) */

next_day(date_sub(calendar_d, 1), 'SAT')


INSERT OVERWRITE DIRECTORY '/user/SVPRIHDS/hive/competitor_raw_data_stg' 
SELECT t1.*, t2.FISCAL_WEEK_END_D as shop_crawl_week_end_d
FROM prd_priceent_fnd.competitor_raw_data t1
JOIN prd_cal_fnd.calendar t2
ON t1.shop_crawl_d = t2.CALENDAR_D;
where shop_crawl_d >= date_add(current_date, -15);


INSERT OVERWRITE TABLE stg_priceent_fnd.competitor_raw_data_tmp
SELECT t1.*, t2.FISCAL_WEEK_END_D as shop_crawl_week_end_d
FROM prd_priceent_fnd.competitor_raw_data t1
JOIN prd_cal_fnd.calendar t2
ON t1.shop_crawl_d = t2.CALENDAR_D where shop_crawl_d >= date_add(current_date, -15);






INSERT OVERWRITE TABLE stg_priceent_fnd.competitor_raw_data_tmp
partition (shop_crawl_week_end_d, chain_n)
SELECT *,  next_day(date_sub(shop_crawl_d, 1), 'SAT') as shop_crawl_week_end_d
FROM prd_priceent_fnd.competitor_raw_data 
where shop_crawl_d >= date_add(current_date, -7);



create external table if not EXISTS prd_priceent_tmp.competitor_raw_data_tmp1 (
    vendor_provided_store_id  string COMMENT 'Unique identifier created for store locations by source team. This is used to join productlisting/result DSB files with Stores files.Sample Values : 0183befb-5613-3154-bfd0-530d124155f9,020d464d-a0bb-3a9b-961a-d84f146f4227'
  , vendor_provided_export_product_id  string COMMENT 'Unique identifier created for items by source team. This is used to join productlisting/result DSB files with Product files.Sample Values : b93d69ed-9f67-3170-8f24-94a64e5ac248,87289b85-dc8b-3924-9859-8930e11ab7ef'
  , banner_n  string COMMENT 'This is the brand name of the retailer at this location. For example, the Kroger chain operates stores under the banners King Soopers, Kroger, Frys Food, etc. Sample Values : WALMART,DOLLAR GENERAL,MEIJER'
  , banner_id  string COMMENT 'Unique identifier of a banner. A banner is also uniquely identified by the combination of chain and banner. This is a Datasembly identifier. Sample values :c624d14db3124e13a8cf080171cb50f3,714bc76991314f7993e07fbbcb12782d'
  , channel_method_n  string COMMENT 'Method by which the product is provided to the customer. Possible values are: instore, pickup, localdelivery, and ecommerce'
  , country_n  string COMMENT 'Country where the listing is located. Defaults to USA if not provided. Sample Values : US'
  , shop_create_utc_ts  timestamp COMMENT 'Timestamp which indicates when the shopping signal was captured. Sample Values : 2022-04-18 22:46:55.071,2022-04-18 21:50:40.106'
  , vendor_provided_result_id  string COMMENT 'Unique identifier created for competitor price signals by source team. This will be unique and different for all item locations every week.Sample Values : d0c92914-915a-3587-a19f-1f00457e86d7,5753660b-cdda-300a-8b65-227fd3e192f7'
  , export_id  string COMMENT 'Unique Identifier for every weeks load/export. This will be same for all signals in the same week but will be different for different week. Sample values : 12117,12118'
  , host_n  string COMMENT 'This indicates the domain of the host from which the data was collected (e.g. www.walmart.com, grocery.walmart.com, www.kroger.com, etc.)'
  , in_stock_f  boolean COMMENT 'Flag which indicates if the item is available and in stock in the competitor store. Sample values : true,false'
  , price_0_clearance_f  boolean COMMENT 'This flag indicates if the price is clearance price. This will be true if the price is clearance price.  Sample values : true,false'
  , price_0_reduced_f  boolean COMMENT 'This flag indicates if the price is strikeout/reduced price. This will be true if the price is strikeout/reduced price.  Sample values : true,false'
  , price_0_currency_c  string COMMENT 'Currency of the price value of the competitor signal captured.Sample values : USD,CAD'
  , price_0_end_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_0_in_store_price_f  boolean COMMENT 'This flag indicates if the price is same as in-store price. This will be true if the price is same.  Sample values : true,false'
  , price_0_loyalty_f  boolean COMMENT 'This flag indicates if the price is available through a loyalty program. This will be true if the price is based on loyalty program.  Sample values : true,false'
  , price_0_membership_f  boolean COMMENT 'This flag indicates if the price is for customers through a membership account. This will be true if the price is based on membership program.  Sample values : true,false'
  , price_0_multiple_q  double COMMENT 'Multiple component of the price (e.g. 2 in 2 for $5). The each price can be calculated by dividing the price by the multiple (e.g. 2 for $5 ? $2.50 each). Assume 1 if null'
  , price_0_price_a  double COMMENT 'Price component of the competitor item. Sample values : 5.99,1.99'
  , price_0_promotion_f  boolean COMMENT 'This flag indicates if the price is same as promotional price. This will be true if the price is promo price. Sample values : true,false'
  , price_0_rollback_f  boolean COMMENT 'This flag indicates if the price is rollback price. This will be true if the price is rollback price.This applies only to data collected from Walmart hosts. Sample values : true,false'
  , price_0_sold_per_unit_f  boolean COMMENT 'This will be True if this price is sold by a variable unit (e.g. pounds, ounces, inches, etc.). Sample values : true,false'
  , price_0_start_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_0_unit_price_a  double COMMENT 'This indicates the price component of the unit price (e.g. 2.55 in $2.55 / lb) for the competitor item. Sample values : 5.37,0.077'
  , price_0_unit_price_multiple_q  double COMMENT 'This indicates the Unit multiple (e.g. 1.5 in $5.00 / 1.5 lbs) for the competitor item. Assume 1 if null'
  , price_0_unit_price_uom  string COMMENT 'This indicates the Unit of measure of the unit price (e.g. lbs in $2.55 / lb) for the competitor item. Sample values : ounce,fluid ounce'
  , price_1_clearance_f  string COMMENT 'This flag indicates if the price is clearance price. This will be true if the price is clearance price.  Sample values : true,false'
  , price_1_reduced_f  boolean COMMENT 'This flag indicates if the price is strikeout/reduced price. This will be true if the price is strikeout/reduced price.  Sample values : true,false'
  , price_1_currency_c  string COMMENT 'Currency of the price value of the competitor signal captured.Sample values : USD,CAD'
  , price_1_end_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_1_in_store_price_f  boolean COMMENT 'This flag indicates if the price is same as in-store price. This will be true if the price is same.  Sample values : true,false'
  , price_1_loyalty_f  boolean COMMENT 'This flag indicates if the price is available through a loyalty program. This will be true if the price is based on loyalty program.  Sample values : true,false'
  , price_1_membership_f  boolean COMMENT 'This flag indicates if the price is for customers through a membership account. This will be true if the price is based on membership program.  Sample values : true,false'
  , price_1_multiple_q  double COMMENT 'Multiple component of the price (e.g. 2 in 2 for $5). The each price can be calculated by dividing the price by the multiple (e.g. 2 for $5 ? $2.50 each). Assume 1 if null'
  , price_1_price_a  double COMMENT 'Price component of the competitor item. Sample values : 5.99,8.49'
  , price_1_promotion_f  boolean COMMENT 'This flag indicates if the price is same as promotional price. This will be true if the price is promo price. Sample values : true,false'
  , price_1_rollback_f  boolean COMMENT 'This flag indicates if the price is rollback price. This will be true if the price is rollback price.This applies only to data collected from Walmart hosts. Sample values : true,false'
  , price_1_sold_per_unit_f  boolean COMMENT 'This will be True if this price is sold by a variable unit (e.g. pounds, ounces, inches, etc.). Sample values : true,false'
  , price_1_start_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_1_unit_price_a  string COMMENT 'This indicates the price component of the unit price (e.g. 2.55 in $2.55 / lb) for the competitor item. Sample values : 5.37,0.077'
  , price_1_unit_price_multiple_q  string COMMENT 'This indicates the Unit multiple (e.g. 1.5 in $5.00 / 1.5 lbs) for the competitor item. Assume 1 if null'
  , price_1_unit_price_uom  string COMMENT 'This indicates the Unit of measure of the unit price (e.g. lbs in $2.55 / lb) for the competitor item. Sample values : ounce,fluid ounce'
  , regular_retail_a double COMMENT 'This is the regular retail amount of the competitor item calculated using price_1 and price_0 flags.Sample values : 19.98,5.98'
  , offer_retail_a double COMMENT 'This is the offer retail amount of the competitor item calculated using price_1 and price_0 flags.Sample values : 14.98,2.98'
  , anomalous_price_f boolean COMMENT 'This flag indicates if the price points are far off from the average price points of the item across different locations, in a given week.Sample values : true,false'
  , store_id  string COMMENT 'Unique identifier of a store. This is a Datasembly identifier and should be used to connect product listings to stores. Sample values : 9278abe36f754cfca1eeed831bf023f2,7d7419aba6a846ef89c21080ce88d123,6798a298156c48819cc39911c0df644c'
  , store_inferred_f  boolean COMMENT 'This will be True if the store is inferred from the banner and postal code. This marks data where the store was not provided on the site (often because it uses a shop by postal code system) but we are confident that the listings match the in store listings. Sample values : true,false'
  , surrogate_product_id  string COMMENT 'Surrogate ID is a unique identifier for a product. All surrogate IDs are only valid within the same export and are not stable across exports. This can be used to join to products.Sample values : c93f2ca406afa44aca1262bfe3a77002,3f8b06bdf65d8ad28c06088d58dd9b6d'
  , additional_product_desc  string COMMENT 'Full description captured from the source for the competitor item. Ex : You cant beat an original, especially when its as smooth, creamy and delicious as Yoplait. Its Low Fat, Gluten Free and has No High Fructose Corn Syrup, No Artificial Flavors or No Colors From Artificial Sources'
  , brand_n  string COMMENT 'Name of the products brand as listed by the seller. Sample values : MARKETSIDE,YOPLAIT,FAIRLIFE'
  , category_level_0  string COMMENT 'Top level category of the item as listed by the seller. Sample values : Food,Health,Office & School Supplies'
  , category_level_1  string COMMENT 'Second level category of the item as listed by the seller. Sample values : Dairy & Eggs,Meat & Seafood,Medicine Cabinet'
  , category_level_2  string COMMENT 'Third level category of the item as listed by the seller. Sample values : Yogurt,Chicken,Milk, Cough Cold & Flu'
  , count_q  string COMMENT 'Total no of unit items present in one pack of competitor item.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is 216. Sample values : 16.0,4.0'
  , count_units_n  string COMMENT 'Unit of measure for the above count_q attribute.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is count. Sample values : count'
  , vendor_provided_product_id  string COMMENT 'Unique identifier created for items by source team. This is used to join productlisting/result DSB files with Product files.Sample Values : 924d1612-c5c2-3574-b53f-19804879efe0,993cd00b-83cf-302f-8616-97f7ee362e9b'
  , product_desc  string COMMENT 'Products description of the competitor item as listed by the seller. Sample values  : Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct,Johnsonville Sausage Strips Original, 12 Count, 12 oz '
  , dpci  string COMMENT 'Item Identifier which is a combination of department,class and item ids in ddd-cc-iiii format.Sample values : 049-09-0228,231-15-0795,003-07-0142'
  , vendor_provided_brand_n  string COMMENT 'Name of the products brand. Provided from the Datasembly taxonomy where available. Sample values:  MARKETSIDE,YOPLAIT,FAIRLIFE'
  , vendor_provided_category_level_0  string COMMENT 'Top level category of the item provided from the Datasembly taxonomy where available. Sample values: Food,Health,Office & School Supplies'
  , vendor_provided_category_level_1  string COMMENT 'Second level category of the item provided from the Datasembly taxonomy where available. Sample values: Dairy & Eggs,Meat & Seafood,Medicine Cabinet'
  , vendor_provided_desc  string COMMENT 'Products description. Provided from the Datasembly taxonomy where available. Sample values: Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct,Johnsonville Sausage Strips Original, 12 Count, 12 oz'
  , vendor_provided_size_q  string COMMENT 'Numeric size of the product. Provided from the Datasembly taxonomy where available. Sample values: 32.0,52.0'
  , vendor_provided_size_units_n  string COMMENT 'Size units of the product. Provided from the Datasembly taxonomy where available. Sample values: ounce,pound,fluid ounce'
  , image_url  string COMMENT 'Image url of the competitor item scrapped from the competitor website/store. Sample values : https://i5.walmartimages.com/asr/57608d77-af57-4483-96fe-1652e4af7ed1.0c460c2ec841bc5d86175743de3173f7.jpeg'
  , pack_count_q  double COMMENT 'Total no of packs present in competitor item.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is 3. Sample values : 16.0,4.0,3.0'
  , pack_count_units_n  string COMMENT 'Unit of measure for the above pack_count_q attribute.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is pack. Sample values : count'
  , product_type_t  string COMMENT 'Product type of the item. Sample values : Yogurts,Chicken,Milks'
  , size_q  double COMMENT 'Numeric size of the product. Taken directly from the seller if listed numerically or extracted from the size_text where possible. Sample values : 32.0,52.0'
  , size_t  string COMMENT 'Products size as listed by the seller.Sample values :  0.5 [lb_av],1.89 [lb_av]'
  , size_uom  string COMMENT 'Size units of the product (e.g. ounce, inch, etc.). Taken directly from the seller if listed with enumerable unit names or extracted from the size_text where possible.Sample values : ounce,pound,fluid ounce'
  , sku  string COMMENT 'This is the Retailers SKU code of the product. Uniquely identifies a product at a specific banner. Sample values : 371202137,913548604'
  , tcin  string COMMENT 'Uniquely identifiable item number. This helps in joining the item tables to get other attributes like items description,metadata etc.Sample values: 82371355, 82371234, 82371358 etc.'
  , chain_n  string COMMENT 'This is the chain name of the retailer at this location. For example, the Kroger chain operates stores under the banners King Soopers, Kroger, Frys Food, etc. Sample Values : WALMART,DOLLAR GENERAL,MEIJER'
  , upc  string COMMENT 'This is universal product code of the item and can be used as item identifier.Sample values : 47701002773,762111204707,44600313719'
  , address_t  string COMMENT 'This indicates the address of the competitor location.Example values: 7150 Gale Ave,455 Elk Grove Blvd,14865 Telegraph Road,490 RODRIGUEZ ST'
  , city_n  string COMMENT 'This indicates the city of the competitor location.Example values: Elk Grove,Hacienda Heights,WATSONVILLE,LA MIRADA'
  , latitude  string COMMENT 'This gives the latitude coordinate of the competitors geographic location.Example values: 33.998396,38.410207'
  , longitude  string COMMENT 'This gives the longitude coordinate of the competitors geographic location.Example values: -121.39202,-117.93236'
  , postal_c  string COMMENT 'Postal code where the listing is located. This is always present when a store_id is not present, but it is only sometimes present when a store_id is provided. Sample values : 95076,90638,43228,28504'
  , state_c  string COMMENT 'This indicates the state_code of the competitor store/location.Example values: CA,TX,NC,OH'
  , status_f  boolean COMMENT 'This indicates whether the store was operational as of last time the stores data was updated.Sample values : true,false'
  , store_number  string COMMENT 'Store number assigned to the store by the banner. This is the numeric version of the store id and can be used to join to other competitor location related tables.Sample Values : 5661,9796,104,10935'
  , updated_d  string COMMENT 'This indicates when the store was operational as of last time the stores data was updated.Sample values : 2022-04-17,2022-04-10'
  , shop_crawl_d  date  COMMENT 'This indicates the day this listing was observed and is also the partition column of the dataset Sample Values : 2022-04-17,2021-01-01'
   )
PARTITIONED BY (shop_crawl_week_end_d date ,derived_chain_n string)
stored as orc
LOCATION '/user/SVPRIHDP/prd/external/competitor_raw_data/'
TBLPROPERTIES ( 'ORC.COMPRESS'='SNAPPY')
;



create external table if not EXISTS prd_priceent_fnd.competitor_raw_data (
    vendor_provided_store_id  string COMMENT 'Unique identifier created for store locations by source team. This is used to join productlisting/result DSB files with Stores files.Sample Values : 0183befb-5613-3154-bfd0-530d124155f9,020d464d-a0bb-3a9b-961a-d84f146f4227'
  , vendor_provided_export_product_id  string COMMENT 'Unique identifier created for items by source team. This is used to join productlisting/result DSB files with Product files.Sample Values : b93d69ed-9f67-3170-8f24-94a64e5ac248,87289b85-dc8b-3924-9859-8930e11ab7ef'
  , banner_n  string COMMENT 'This is the brand name of the retailer at this location. For example, the Kroger chain operates stores under the banners King Soopers, Kroger, Frys Food, etc. Sample Values : WALMART,DOLLAR GENERAL,MEIJER'
  , banner_id  string COMMENT 'Unique identifier of a banner. A banner is also uniquely identified by the combination of chain and banner. This is a Datasembly identifier. Sample values :c624d14db3124e13a8cf080171cb50f3,714bc76991314f7993e07fbbcb12782d'
  , channel_method_n  string COMMENT 'Method by which the product is provided to the customer. Possible values are: instore, pickup, localdelivery, and ecommerce'
  , country_n  string COMMENT 'Country where the listing is located. Defaults to USA if not provided. Sample Values : US'
  , shop_create_utc_ts  timestamp COMMENT 'Timestamp which indicates when the shopping signal was captured. Sample Values : 2022-04-18 22:46:55.071,2022-04-18 21:50:40.106'
  , vendor_provided_result_id  string COMMENT 'Unique identifier created for competitor price signals by source team. This will be unique and different for all item locations every week.Sample Values : d0c92914-915a-3587-a19f-1f00457e86d7,5753660b-cdda-300a-8b65-227fd3e192f7'
  , export_id  string COMMENT 'Unique Identifier for every weeks load/export. This will be same for all signals in the same week but will be different for different week. Sample values : 12117,12118'
  , host_n  string COMMENT 'This indicates the domain of the host from which the data was collected (e.g. www.walmart.com, grocery.walmart.com, www.kroger.com, etc.)'
  , in_stock_f  boolean COMMENT 'Flag which indicates if the item is available and in stock in the competitor store. Sample values : true,false'
  , price_0_clearance_f  boolean COMMENT 'This flag indicates if the price is clearance price. This will be true if the price is clearance price.  Sample values : true,false'
  , price_0_reduced_f  boolean COMMENT 'This flag indicates if the price is strikeout/reduced price. This will be true if the price is strikeout/reduced price.  Sample values : true,false'
  , price_0_currency_c  string COMMENT 'Currency of the price value of the competitor signal captured.Sample values : USD,CAD'
  , price_0_end_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_0_in_store_price_f  boolean COMMENT 'This flag indicates if the price is same as in-store price. This will be true if the price is same.  Sample values : true,false'
  , price_0_loyalty_f  boolean COMMENT 'This flag indicates if the price is available through a loyalty program. This will be true if the price is based on loyalty program.  Sample values : true,false'
  , price_0_membership_f  boolean COMMENT 'This flag indicates if the price is for customers through a membership account. This will be true if the price is based on membership program.  Sample values : true,false'
  , price_0_multiple_q  double COMMENT 'Multiple component of the price (e.g. 2 in 2 for $5). The each price can be calculated by dividing the price by the multiple (e.g. 2 for $5 ? $2.50 each). Assume 1 if null'
  , price_0_price_a  double COMMENT 'Price component of the competitor item. Sample values : 5.99,1.99'
  , price_0_promotion_f  boolean COMMENT 'This flag indicates if the price is same as promotional price. This will be true if the price is promo price. Sample values : true,false'
  , price_0_rollback_f  boolean COMMENT 'This flag indicates if the price is rollback price. This will be true if the price is rollback price.This applies only to data collected from Walmart hosts. Sample values : true,false'
  , price_0_sold_per_unit_f  boolean COMMENT 'This will be True if this price is sold by a variable unit (e.g. pounds, ounces, inches, etc.). Sample values : true,false'
  , price_0_start_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_0_unit_price_a  double COMMENT 'This indicates the price component of the unit price (e.g. 2.55 in $2.55 / lb) for the competitor item. Sample values : 5.37,0.077'
  , price_0_unit_price_multiple_q  double COMMENT 'This indicates the Unit multiple (e.g. 1.5 in $5.00 / 1.5 lbs) for the competitor item. Assume 1 if null'
  , price_0_unit_price_uom  string COMMENT 'This indicates the Unit of measure of the unit price (e.g. lbs in $2.55 / lb) for the competitor item. Sample values : ounce,fluid ounce'
  , price_1_clearance_f  string COMMENT 'This flag indicates if the price is clearance price. This will be true if the price is clearance price.  Sample values : true,false'
  , price_1_reduced_f  boolean COMMENT 'This flag indicates if the price is strikeout/reduced price. This will be true if the price is strikeout/reduced price.  Sample values : true,false'
  , price_1_currency_c  string COMMENT 'Currency of the price value of the competitor signal captured.Sample values : USD,CAD'
  , price_1_end_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_1_in_store_price_f  boolean COMMENT 'This flag indicates if the price is same as in-store price. This will be true if the price is same.  Sample values : true,false'
  , price_1_loyalty_f  boolean COMMENT 'This flag indicates if the price is available through a loyalty program. This will be true if the price is based on loyalty program.  Sample values : true,false'
  , price_1_membership_f  boolean COMMENT 'This flag indicates if the price is for customers through a membership account. This will be true if the price is based on membership program.  Sample values : true,false'
  , price_1_multiple_q  double COMMENT 'Multiple component of the price (e.g. 2 in 2 for $5). The each price can be calculated by dividing the price by the multiple (e.g. 2 for $5 ? $2.50 each). Assume 1 if null'
  , price_1_price_a  double COMMENT 'Price component of the competitor item. Sample values : 5.99,8.49'
  , price_1_promotion_f  boolean COMMENT 'This flag indicates if the price is same as promotional price. This will be true if the price is promo price. Sample values : true,false'
  , price_1_rollback_f  boolean COMMENT 'This flag indicates if the price is rollback price. This will be true if the price is rollback price.This applies only to data collected from Walmart hosts. Sample values : true,false'
  , price_1_sold_per_unit_f  boolean COMMENT 'This will be True if this price is sold by a variable unit (e.g. pounds, ounces, inches, etc.). Sample values : true,false'
  , price_1_start_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_1_unit_price_a  string COMMENT 'This indicates the price component of the unit price (e.g. 2.55 in $2.55 / lb) for the competitor item. Sample values : 5.37,0.077'
  , price_1_unit_price_multiple_q  string COMMENT 'This indicates the Unit multiple (e.g. 1.5 in $5.00 / 1.5 lbs) for the competitor item. Assume 1 if null'
  , price_1_unit_price_uom  string COMMENT 'This indicates the Unit of measure of the unit price (e.g. lbs in $2.55 / lb) for the competitor item. Sample values : ounce,fluid ounce'
  , regular_retail_a double COMMENT 'This is the regular retail amount of the competitor item calculated using price_1 and price_0 flags.Sample values : 19.98,5.98'
  , offer_retail_a double COMMENT 'This is the offer retail amount of the competitor item calculated using price_1 and price_0 flags.Sample values : 14.98,2.98'
  , anomalous_price_f boolean COMMENT 'This flag indicates if the price points are far off from the average price points of the item across different locations, in a given week.Sample values : true,false'
  , store_id  string COMMENT 'Unique identifier of a store. This is a Datasembly identifier and should be used to connect product listings to stores. Sample values : 9278abe36f754cfca1eeed831bf023f2,7d7419aba6a846ef89c21080ce88d123,6798a298156c48819cc39911c0df644c'
  , store_inferred_f  boolean COMMENT 'This will be True if the store is inferred from the banner and postal code. This marks data where the store was not provided on the site (often because it uses a shop by postal code system) but we are confident that the listings match the in store listings. Sample values : true,false'
  , surrogate_product_id  string COMMENT 'Surrogate ID is a unique identifier for a product. All surrogate IDs are only valid within the same export and are not stable across exports. This can be used to join to products.Sample values : c93f2ca406afa44aca1262bfe3a77002,3f8b06bdf65d8ad28c06088d58dd9b6d'
  , additional_product_desc  string COMMENT 'Full description captured from the source for the competitor item. Ex : You cant beat an original, especially when its as smooth, creamy and delicious as Yoplait. Its Low Fat, Gluten Free and has No High Fructose Corn Syrup, No Artificial Flavors or No Colors From Artificial Sources'
  , brand_n  string COMMENT 'Name of the products brand as listed by the seller. Sample values : MARKETSIDE,YOPLAIT,FAIRLIFE'
  , category_level_0  string COMMENT 'Top level category of the item as listed by the seller. Sample values : Food,Health,Office & School Supplies'
  , category_level_1  string COMMENT 'Second level category of the item as listed by the seller. Sample values : Dairy & Eggs,Meat & Seafood,Medicine Cabinet'
  , category_level_2  string COMMENT 'Third level category of the item as listed by the seller. Sample values : Yogurt,Chicken,Milk, Cough Cold & Flu'
  , count_q  string COMMENT 'Total no of unit items present in one pack of competitor item.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is 216. Sample values : 16.0,4.0'
  , count_units_n  string COMMENT 'Unit of measure for the above count_q attribute.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is count. Sample values : count'
  , vendor_provided_product_id  string COMMENT 'Unique identifier created for items by source team. This is used to join productlisting/result DSB files with Product files.Sample Values : 924d1612-c5c2-3574-b53f-19804879efe0,993cd00b-83cf-302f-8616-97f7ee362e9b'
  , product_desc  string COMMENT 'Products description of the competitor item as listed by the seller. Sample values  : Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct,Johnsonville Sausage Strips Original, 12 Count, 12 oz '
  , dpci  string COMMENT 'Item Identifier which is a combination of department,class and item ids in ddd-cc-iiii format.Sample values : 049-09-0228,231-15-0795,003-07-0142'
  , vendor_provided_brand_n  string COMMENT 'Name of the products brand. Provided from the Datasembly taxonomy where available. Sample values:  MARKETSIDE,YOPLAIT,FAIRLIFE'
  , vendor_provided_category_level_0  string COMMENT 'Top level category of the item provided from the Datasembly taxonomy where available. Sample values: Food,Health,Office & School Supplies'
  , vendor_provided_category_level_1  string COMMENT 'Second level category of the item provided from the Datasembly taxonomy where available. Sample values: Dairy & Eggs,Meat & Seafood,Medicine Cabinet'
  , vendor_provided_desc  string COMMENT 'Products description. Provided from the Datasembly taxonomy where available. Sample values: Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct,Johnsonville Sausage Strips Original, 12 Count, 12 oz'
  , vendor_provided_size_q  string COMMENT 'Numeric size of the product. Provided from the Datasembly taxonomy where available. Sample values: 32.0,52.0'
  , vendor_provided_size_units_n  string COMMENT 'Size units of the product. Provided from the Datasembly taxonomy where available. Sample values: ounce,pound,fluid ounce'
  , image_url  string COMMENT 'Image url of the competitor item scrapped from the competitor website/store. Sample values : https://i5.walmartimages.com/asr/57608d77-af57-4483-96fe-1652e4af7ed1.0c460c2ec841bc5d86175743de3173f7.jpeg'
  , pack_count_q  double COMMENT 'Total no of packs present in competitor item.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is 3. Sample values : 16.0,4.0,3.0'
  , pack_count_units_n  string COMMENT 'Unit of measure for the above pack_count_q attribute.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is pack. Sample values : count'
  , product_type_t  string COMMENT 'Product type of the item. Sample values : Yogurts,Chicken,Milks'
  , size_q  double COMMENT 'Numeric size of the product. Taken directly from the seller if listed numerically or extracted from the size_text where possible. Sample values : 32.0,52.0'
  , size_t  string COMMENT 'Products size as listed by the seller.Sample values :  0.5 [lb_av],1.89 [lb_av]'
  , size_uom  string COMMENT 'Size units of the product (e.g. ounce, inch, etc.). Taken directly from the seller if listed with enumerable unit names or extracted from the size_text where possible.Sample values : ounce,pound,fluid ounce'
  , sku  string COMMENT 'This is the Retailers SKU code of the product. Uniquely identifies a product at a specific banner. Sample values : 371202137,913548604'
  , tcin  string COMMENT 'Uniquely identifiable item number. This helps in joining the item tables to get other attributes like items description,metadata etc.Sample values: 82371355, 82371234, 82371358 etc.'
  , chain_n  string COMMENT 'This is the chain name of the retailer at this location. For example, the Kroger chain operates stores under the banners King Soopers, Kroger, Frys Food, etc. Sample Values : WALMART,DOLLAR GENERAL,MEIJER'
  , upc  string COMMENT 'This is universal product code of the item and can be used as item identifier.Sample values : 47701002773,762111204707,44600313719'
  , address_t  string COMMENT 'This indicates the address of the competitor location.Example values: 7150 Gale Ave,455 Elk Grove Blvd,14865 Telegraph Road,490 RODRIGUEZ ST'
  , city_n  string COMMENT 'This indicates the city of the competitor location.Example values: Elk Grove,Hacienda Heights,WATSONVILLE,LA MIRADA'
  , latitude  string COMMENT 'This gives the latitude coordinate of the competitors geographic location.Example values: 33.998396,38.410207'
  , longitude  string COMMENT 'This gives the longitude coordinate of the competitors geographic location.Example values: -121.39202,-117.93236'
  , postal_c  string COMMENT 'Postal code where the listing is located. This is always present when a store_id is not present, but it is only sometimes present when a store_id is provided. Sample values : 95076,90638,43228,28504'
  , state_c  string COMMENT 'This indicates the state_code of the competitor store/location.Example values: CA,TX,NC,OH'
  , status_f  boolean COMMENT 'This indicates whether the store was operational as of last time the stores data was updated.Sample values : true,false'
  , store_number  string COMMENT 'Store number assigned to the store by the banner. This is the numeric version of the store id and can be used to join to other competitor location related tables.Sample Values : 5661,9796,104,10935'
  , updated_d  string COMMENT 'This indicates when the store was operational as of last time the stores data was updated.Sample values : 2022-04-17,2022-04-10'
  , shop_crawl_d  date  COMMENT 'This indicates the day this listing was observed and is also the partition column of the dataset Sample Values : 2022-04-17,2021-01-01'
   )
PARTITIONED BY (shop_crawl_week_end_d date ,derived_chain_n string)
stored as orc
LOCATION '/user/SVPRIHDP/hive/external/competitor_raw_data/'
TBLPROPERTIES ( 'ORC.COMPRESS'='SNAPPY')
;



create external table prd_priceent_fnd.competitor_raw_data(
    vendor_provided_store_id  string COMMENT 'Unique identifier created for store locations by source team. This is used to join productlisting/result DSB files with Stores files.Sample Values : 0183befb-5613-3154-bfd0-530d124155f9,020d464d-a0bb-3a9b-961a-d84f146f4227'
  , vendor_provided_export_product_id  string COMMENT 'Unique identifier created for items by source team. This is used to join productlisting/result DSB files with Product files.Sample Values : b93d69ed-9f67-3170-8f24-94a64e5ac248,87289b85-dc8b-3924-9859-8930e11ab7ef'
  , banner_n  string COMMENT 'This is the brand name of the retailer at this location. For example, the Kroger chain operates stores under the banners King Soopers, Kroger, Frys Food, etc. Sample Values : WALMART,DOLLAR GENERAL,MEIJER'
  , banner_id  string COMMENT 'Unique identifier of a banner. A banner is also uniquely identified by the combination of chain and banner. This is a Datasembly identifier. Sample values :c624d14db3124e13a8cf080171cb50f3,714bc76991314f7993e07fbbcb12782d'
  , channel_method_n  string COMMENT 'Method by which the product is provided to the customer. Possible values are: instore, pickup, localdelivery, and ecommerce'
  , country_n  string COMMENT 'Country where the listing is located. Defaults to USA if not provided. Sample Values : US'
  , shop_create_utc_ts  timestamp COMMENT 'Timestamp which indicates when the shopping signal was captured. Sample Values : 2022-04-18 22:46:55.071,2022-04-18 21:50:40.106'
  , vendor_provided_result_id  string COMMENT 'Unique identifier created for competitor price signals by source team. This will be unique and different for all item locations every week.Sample Values : d0c92914-915a-3587-a19f-1f00457e86d7,5753660b-cdda-300a-8b65-227fd3e192f7'
  , export_id  string COMMENT 'Unique Identifier for every weeks load/export. This will be same for all signals in the same week but will be different for different week. Sample values : 12117,12118'
  , host_n  string COMMENT 'This indicates the domain of the host from which the data was collected (e.g. www.walmart.com, grocery.walmart.com, www.kroger.com, etc.)'
  , in_stock_f  boolean COMMENT 'Flag which indicates if the item is available and in stock in the competitor store. Sample values : true,false'
  , price_0_clearance_f  boolean COMMENT 'This flag indicates if the price is clearance price. This will be true if the price is clearance price.  Sample values : true,false'
  , price_0_reduced_f  boolean COMMENT 'This flag indicates if the price is strikeout/reduced price. This will be true if the price is strikeout/reduced price.  Sample values : true,false'
  , price_0_currency_c  string COMMENT 'Currency of the price value of the competitor signal captured.Sample values : USD,CAD'
  , price_0_end_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_0_in_store_price_f  boolean COMMENT 'This flag indicates if the price is same as in-store price. This will be true if the price is same.  Sample values : true,false'
  , price_0_loyalty_f  boolean COMMENT 'This flag indicates if the price is available through a loyalty program. This will be true if the price is based on loyalty program.  Sample values : true,false'
  , price_0_membership_f  boolean COMMENT 'This flag indicates if the price is for customers through a membership account. This will be true if the price is based on membership program.  Sample values : true,false'
  , price_0_multiple_q  double COMMENT 'Multiple component of the price (e.g. 2 in 2 for $5). The each price can be calculated by dividing the price by the multiple (e.g. 2 for $5 ? $2.50 each). Assume 1 if null'
  , price_0_price_a  double COMMENT 'Price component of the competitor item. Sample values : 5.99,1.99'
  , price_0_promotion_f  boolean COMMENT 'This flag indicates if the price is same as promotional price. This will be true if the price is promo price. Sample values : true,false'
  , price_0_rollback_f  boolean COMMENT 'This flag indicates if the price is rollback price. This will be true if the price is rollback price.This applies only to data collected from Walmart hosts. Sample values : true,false'
  , price_0_sold_per_unit_f  boolean COMMENT 'This will be True if this price is sold by a variable unit (e.g. pounds, ounces, inches, etc.). Sample values : true,false'
  , price_0_start_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_0_unit_price_a  double COMMENT 'This indicates the price component of the unit price (e.g. 2.55 in $2.55 / lb) for the competitor item. Sample values : 5.37,0.077'
  , price_0_unit_price_multiple_q  double COMMENT 'This indicates the Unit multiple (e.g. 1.5 in $5.00 / 1.5 lbs) for the competitor item. Assume 1 if null'
  , price_0_unit_price_uom  string COMMENT 'This indicates the Unit of measure of the unit price (e.g. lbs in $2.55 / lb) for the competitor item. Sample values : ounce,fluid ounce'
  , price_1_clearance_f  string COMMENT 'This flag indicates if the price is clearance price. This will be true if the price is clearance price.  Sample values : true,false'
  , price_1_reduced_f  boolean COMMENT 'This flag indicates if the price is strikeout/reduced price. This will be true if the price is strikeout/reduced price.  Sample values : true,false'
  , price_1_currency_c  string COMMENT 'Currency of the price value of the competitor signal captured.Sample values : USD,CAD'
  , price_1_end_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_1_in_store_price_f  boolean COMMENT 'This flag indicates if the price is same as in-store price. This will be true if the price is same.  Sample values : true,false'
  , price_1_loyalty_f  boolean COMMENT 'This flag indicates if the price is available through a loyalty program. This will be true if the price is based on loyalty program.  Sample values : true,false'
  , price_1_membership_f  boolean COMMENT 'This flag indicates if the price is for customers through a membership account. This will be true if the price is based on membership program.  Sample values : true,false'
  , price_1_multiple_q  double COMMENT 'Multiple component of the price (e.g. 2 in 2 for $5). The each price can be calculated by dividing the price by the multiple (e.g. 2 for $5 ? $2.50 each). Assume 1 if null'
  , price_1_price_a  double COMMENT 'Price component of the competitor item. Sample values : 5.99,8.49'
  , price_1_promotion_f  boolean COMMENT 'This flag indicates if the price is same as promotional price. This will be true if the price is promo price. Sample values : true,false'
  , price_1_rollback_f  boolean COMMENT 'This flag indicates if the price is rollback price. This will be true if the price is rollback price.This applies only to data collected from Walmart hosts. Sample values : true,false'
  , price_1_sold_per_unit_f  boolean COMMENT 'This will be True if this price is sold by a variable unit (e.g. pounds, ounces, inches, etc.). Sample values : true,false'
  , price_1_start_d  string COMMENT 'This will be end date for the price if provided by the vendor. Else it will be null Sample values : 2022-04-20,2022-04-13'
  , price_1_unit_price_a  string COMMENT 'This indicates the price component of the unit price (e.g. 2.55 in $2.55 / lb) for the competitor item. Sample values : 5.37,0.077'
  , price_1_unit_price_multiple_q  string COMMENT 'This indicates the Unit multiple (e.g. 1.5 in $5.00 / 1.5 lbs) for the competitor item. Assume 1 if null'
  , price_1_unit_price_uom  string COMMENT 'This indicates the Unit of measure of the unit price (e.g. lbs in $2.55 / lb) for the competitor item. Sample values : ounce,fluid ounce'
  , regular_retail_a double COMMENT 'This is the regular retail amount of the competitor item calculated using price_1 and price_0 flags.Sample values : 19.98,5.98'
  , offer_retail_a double COMMENT 'This is the offer retail amount of the competitor item calculated using price_1 and price_0 flags.Sample values : 14.98,2.98'
  , anomalous_price_f boolean COMMENT 'This flag indicates if the price points are far off from the average price points of the item across different locations, in a given week.Sample values : true,false'
  , store_id  string COMMENT 'Unique identifier of a store. This is a Datasembly identifier and should be used to connect product listings to stores. Sample values : 9278abe36f754cfca1eeed831bf023f2,7d7419aba6a846ef89c21080ce88d123,6798a298156c48819cc39911c0df644c'
  , store_inferred_f  boolean COMMENT 'This will be True if the store is inferred from the banner and postal code. This marks data where the store was not provided on the site (often because it uses a shop by postal code system) but we are confident that the listings match the in store listings. Sample values : true,false'
  , surrogate_product_id  string COMMENT 'Surrogate ID is a unique identifier for a product. All surrogate IDs are only valid within the same export and are not stable across exports. This can be used to join to products.Sample values : c93f2ca406afa44aca1262bfe3a77002,3f8b06bdf65d8ad28c06088d58dd9b6d'
  , additional_product_desc  string COMMENT 'Full description captured from the source for the competitor item. Ex : You cant beat an original, especially when its as smooth, creamy and delicious as Yoplait. Its Low Fat, Gluten Free and has No High Fructose Corn Syrup, No Artificial Flavors or No Colors From Artificial Sources'
  , brand_n  string COMMENT 'Name of the products brand as listed by the seller. Sample values : MARKETSIDE,YOPLAIT,FAIRLIFE'
  , category_level_0  string COMMENT 'Top level category of the item as listed by the seller. Sample values : Food,Health,Office & School Supplies'
  , category_level_1  string COMMENT 'Second level category of the item as listed by the seller. Sample values : Dairy & Eggs,Meat & Seafood,Medicine Cabinet'
  , category_level_2  string COMMENT 'Third level category of the item as listed by the seller. Sample values : Yogurt,Chicken,Milk, Cough Cold & Flu'
  , count_q  string COMMENT 'Total no of unit items present in one pack of competitor item.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is 216. Sample values : 16.0,4.0'
  , count_units_n  string COMMENT 'Unit of measure for the above count_q attribute.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is count. Sample values : count'
  , vendor_provided_product_id  string COMMENT 'Unique identifier created for items by source team. This is used to join productlisting/result DSB files with Product files.Sample Values : 924d1612-c5c2-3574-b53f-19804879efe0,993cd00b-83cf-302f-8616-97f7ee362e9b'
  , product_desc  string COMMENT 'Products description of the competitor item as listed by the seller. Sample values  : Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct,Johnsonville Sausage Strips Original, 12 Count, 12 oz '
  , dpci  string COMMENT 'Item Identifier which is a combination of department,class and item ids in ddd-cc-iiii format.Sample values : 049-09-0228,231-15-0795,003-07-0142'
  , vendor_provided_brand_n  string COMMENT 'Name of the products brand. Provided from the Datasembly taxonomy where available. Sample values:  MARKETSIDE,YOPLAIT,FAIRLIFE'
  , vendor_provided_category_level_0  string COMMENT 'Top level category of the item provided from the Datasembly taxonomy where available. Sample values: Food,Health,Office & School Supplies'
  , vendor_provided_category_level_1  string COMMENT 'Second level category of the item provided from the Datasembly taxonomy where available. Sample values: Dairy & Eggs,Meat & Seafood,Medicine Cabinet'
  , vendor_provided_desc  string COMMENT 'Products description. Provided from the Datasembly taxonomy where available. Sample values: Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct,Johnsonville Sausage Strips Original, 12 Count, 12 oz'
  , vendor_provided_size_q  string COMMENT 'Numeric size of the product. Provided from the Datasembly taxonomy where available. Sample values: 32.0,52.0'
  , vendor_provided_size_units_n  string COMMENT 'Size units of the product. Provided from the Datasembly taxonomy where available. Sample values: ounce,pound,fluid ounce'
  , image_url  string COMMENT 'Image url of the competitor item scrapped from the competitor website/store. Sample values : https://i5.walmartimages.com/asr/57608d77-af57-4483-96fe-1652e4af7ed1.0c460c2ec841bc5d86175743de3173f7.jpeg'
  , pack_count_q  double COMMENT 'Total no of packs present in competitor item.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is 3. Sample values : 16.0,4.0,3.0'
  , pack_count_units_n  string COMMENT 'Unit of measure for the above pack_count_q attribute.For Example , for Gentle Steps Wipes - Softly Scented, 3 Pk., 216 Ct item, value is pack. Sample values : count'
  , product_type_t  string COMMENT 'Product type of the item. Sample values : Yogurts,Chicken,Milks'
  , size_q  double COMMENT 'Numeric size of the product. Taken directly from the seller if listed numerically or extracted from the size_text where possible. Sample values : 32.0,52.0'
  , size_t  string COMMENT 'Products size as listed by the seller.Sample values :  0.5 [lb_av],1.89 [lb_av]'
  , size_uom  string COMMENT 'Size units of the product (e.g. ounce, inch, etc.). Taken directly from the seller if listed with enumerable unit names or extracted from the size_text where possible.Sample values : ounce,pound,fluid ounce'
  , sku  string COMMENT 'This is the Retailers SKU code of the product. Uniquely identifies a product at a specific banner. Sample values : 371202137,913548604'
  , tcin  string COMMENT 'Uniquely identifiable item number. This helps in joining the item tables to get other attributes like items description,metadata etc.Sample values: 82371355, 82371234, 82371358 etc.'
  , chain_n  string COMMENT 'This is the chain name of the retailer at this location. For example, the Kroger chain operates stores under the banners King Soopers, Kroger, Frys Food, etc. Sample Values : WALMART,DOLLAR GENERAL,MEIJER'
  , upc  string COMMENT 'This is universal product code of the item and can be used as item identifier.Sample values : 47701002773,762111204707,44600313719'
  , address_t  string COMMENT 'This indicates the address of the competitor location.Example values: 7150 Gale Ave,455 Elk Grove Blvd,14865 Telegraph Road,490 RODRIGUEZ ST'
  , city_n  string COMMENT 'This indicates the city of the competitor location.Example values: Elk Grove,Hacienda Heights,WATSONVILLE,LA MIRADA'
  , latitude  string COMMENT 'This gives the latitude coordinate of the competitors geographic location.Example values: 33.998396,38.410207'
  , longitude  string COMMENT 'This gives the longitude coordinate of the competitors geographic location.Example values: -121.39202,-117.93236'
  , postal_c  string COMMENT 'Postal code where the listing is located. This is always present when a store_id is not present, but it is only sometimes present when a store_id is provided. Sample values : 95076,90638,43228,28504'
  , state_c  string COMMENT 'This indicates the state_code of the competitor store/location.Example values: CA,TX,NC,OH'
  , status_f  boolean COMMENT 'This indicates whether the store was operational as of last time the stores data was updated.Sample values : true,false'
  , store_number  string COMMENT 'Store number assigned to the store by the banner. This is the numeric version of the store id and can be used to join to other competitor location related tables.Sample Values : 5661,9796,104,10935'
  , updated_d  string COMMENT 'This indicates when the store was operational as of last time the stores data was updated.Sample values : 2022-04-17,2022-04-10'
  , shop_crawl_d  date  COMMENT 'This indicates the day this listing was observed and is also the partition column of the dataset Sample Values : 2022-04-17,2021-01-01'
   )
PARTITIONED BY (shop_crawl_week_end_d date COMMENT 'This indicates the next Saturday day to the shop_crawl_d and is also the partition column of the dataset Sample Values : 2023-06-17,2023-06-26 |'
                ,derived_chain_n string COMMENT 'This indicates the Name of chain_n and can have values WALMART and OTHER values')
stored as orc
LOCATION '/user/SVPRIHDP/hive/external/competitor_raw_data/'
TBLPROPERTIES ( 'ORC.COMPRESS'='SNAPPY');
