hadoop distcp -pb hdfs://bigred3ns/user/SVPRIHDS/hive/competitor_raw_data_stg/shop_crawl_week_end_d=2023-05-06 hdfs://bigred3ns/user/SVPRIHDP/prd/external/competitor_raw_data/


hdfs dfs -setfacl -R -m user:SVPRICTLHDP:rwx /user/SVPRIHDP/hive/digital_ci_pricing/


hdfs dfs -setfacl -R -m user:hive:rwx /user/SVPRIHDP/hive/digital_ci_pricing/

hadoop distcp -pb -f -delete hdfs://bigred3ns/user/SVPRIHDS/hive/competitor_raw_data_stg/*{2023-04-01,} hdfs://bigred3ns/user/SVPRIHDP/prd/external/competitor_raw_data/


find hdfs://bigred3ns/user/SVPRIHDS/hive/competitor_raw_data_stg/ -name "*2023*" -newermt 2023-05-01 -exec hadoop distcp -f -pb {} hdfs://bigred3ns/user/SVPRIHDP/prd/external/competitor_raw_data/ \


find hdfs://bigred3ns/user/SVPRIHDS/hive/competitor_raw_data_stg/ -name "*2023*" -type f -newermt 2023-04-01 


hadoop distcp -pb -f hdfs://bigred3ns/user/SVPRIHDS/hive/competitor_raw_data_stg/shop_crawl_week_end_d=2023-04-*  hdfs://bigred3ns/user/SVPRIHDP/prd/external/competitor_raw_data/


fhadoop fs -rm -r /user/SVPRIHDP/prd/external/competitor_raw_data/


hadoop distcp -pb -delete hdfs://bigred3ns/user/SVPRIHDS/hive/competitor_raw_data_stg/shop_crawl_week_end_d=2022-11-19  hdfs://bigred3ns/user/SVPRIHDP/hive/external/competitor_raw_data

hadoop distcp -pb hdfs://bigred3ns/user/SVPRISTRMHDP/data/price/landing/CompetitorShopresultsShopright/DIP/ephemeral_landing hdfs://bigred3ns/user/SVPRISTRMHDP/data/price/landing/CompetitorShopresultsShopright/DIP/ephemeral_landing_test



hadoop distcp -pb  hdfs://bigred3ns/user/SVPRIHDS/hive/competitor_raw_data_stg/shop_crawl_week_end_d=2021-11-* hdfs://bigred3ns/user/SVPRIHDP/hive/external/competitor_raw_data


hadoop fs -rm -r /user/SVPRIHDP/hive/external/competitor_raw_data/shop_crawl_week_fsend_d=2022-02-*


https://knox.bigred3.target.com:8443/gateway/bigred/jobhistory/joblogs/brdn6259.target.com:8045/container_e4131_1686747763384_3664_01_000001/container_e4131_1686747763384_3664_01_000001/SVPRIHDS/stderr?scheme=http&host=brcn1008.target.com&port=19888

hdfs dfs -ls -R /user/SVPRIHDP/hive/external/competitor_raw_data | grep -v '^d' | wc -l

19217


hadoop distcp -pb -f hdfs://bigred3ns/user/SVPRIHDS/hive/competitor_raw_data_stg/shop_crawl_week_end_d=2023-04-*  hdfs://bigred3ns/user/SVPRIHDP/prd/external/competitor_raw_data/


hadoop distcp -pb file:///home_dir/svpristrmhdp/bigred3/priceinsights/stg/CiDigitalPricing/DIP/workflow.xml hdfs://bigred3ns/user/SVPRISTRMHDP/priceinsights/stg/CiDigitalPricing/DIP/



hadoop distcp -pb file:///home_dir/svpristrmhdp/bigred3/priceinsights/stg/CiDigitalPricing/DIP/stg_digital__identifiation.properties hdfs://bigred3ns/user/SVPRISTRMHDP/priceinsights/stg/CiDigitalPricing/DIP/

stage_application.conf
data_load_dip.sh
log4j.properties
stg_digital__identifiation.properties
workflow.xml


oozie job -config /home_dir/svpristrmhdp/bigred3/priceinsights/prd/CiDigitalPricing/DIP/ci_digital.properties -submit

oozie job -config /home_dir/svpristrmhdp/bigred3/priceinsights/prd/CiDigitalPricing/DIP/ci_digital.properties -run

stg_digital__identifiation.properties

oozie jobs -jobtype=COORDINATOR -filter user=SVPRISTRMHDP\;status=RUNNING

hadoop distcp -pb  hdfs://bigred3ns/common/SVPRISTRMHDP/data/price/archival/Ci_digital_pricing/DIP/lastCompactedCheckPointPath hdfs://bigred3ns/user/SVPRIHDS/data/price/landing/Ci_digital_pricing/DIP/lastCompactedCheckPointPath


hadoop distcp -pb /user/SVPRIHDS/hive/digital_ci_api_dpp/New/crawl_d=2023-08-14 /user/SVPRIHDP/hive/digital_ci_api_dpp/

Count of records in above topic is 3941400

application_1692684672946_1519573

hdfs dfs  -cp  /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/clustermaps/load_date=2023-09-07/success.json /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/clustermaps/load_date=2023-09-08/

hdfs dfs  -cp  /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/clusterprofiles/load_date=2023-09-07/success.json /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/clusterprofiles/load_date=2023-09-08/

hdfs dfs  -cp  /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/cmptgroups/load_date=2023-09-07/success.json /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/cmptgroups/load_date=2023-09-08/

hdfs dfs  -cp  /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/cmptgroups_members/load_date=2023-09-07/success.json /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/cmptgroups_members/load_date=2023-09-08/

hdfs dfs  -cp  /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/competitors_locations/load_date=2023-09-07/success.json /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/competitors_locations/load_date=2023-09-08/

hdfs dfs  -cp  /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/tgtgroups/load_date=2023-09-07/success.json /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/tgtgroups/load_date=2023-09-08/

hdfs dfs  -cp  /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/tgtgroups_members/load_date=2023-09-07/success.json /user/SVPRIHDP/data/price/landing/ClusterMapping/DIP/tgtgroups_members/load_date=2023-09-08/


sh -x /home_dir/svprihds/tmp/sparklens/spark-analyzer_app_id.sh --CIName CI02867580 --APP_ID application_1692684672946_2150919


hdfs dfs -setfacl -R -m user:SVPRIHDS:rwx /user/SVPRIHDP/hive/external/cluster_mapping_data

hdfs dfs -setfacl -R -m user:SVPRIHDS:rwx /user/SVPRISTRMHDP/hive/cluster_mapping_data/external
