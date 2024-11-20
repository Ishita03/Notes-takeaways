//update partition in location mapping 

INSERT INTO stg_priceent_fnd.target_competitor_location_mapping partition (load_d)
select location_id                          
,group_id                             
,group_type_n                         
,cluster_profile_id                   
,cluster_profile_desc                 
,cluster_profile_n                    
,cluster_profile_update_user_id       
,group_details_t                      
,group_n                              
,parent_group_id                      
,group_active_status_f                
,group_update_user_id                 
,group_member_id                      
,location_active_status_f             
,location_update_user_id              
,competitor_location_id               
,competitor_short_n                   
,competitor_location_active_status_f  
,competitor_location_update_user_id   
,competitor_group_member_id           
,competitor_group_id                  
,competitor_group_type_n              
,competitor_group_n                   
,competitor_group_details_t           
,competitor_group_update_user_id      
,competitor_group_active_status_f     
,cluster_map_id                       
,map_active_status_f                  
,map_update_user_id                   
,address_t                            
,city_n                               
,state_c                              
,zip_c                                
,retail_data_reference_id             
,store_number                         
,newton_reference_id                  
,location_n                           
,location_url                         
,channel_n                            
,longitude                            
,latitude                             
,retailer_n                           
,'2023-10-15' as load_d 
from prd_priceent_fnd.target_competitor_location_mapping where load_d = '2023-10-15'


show partitions stg_priceent_fnd.target_competitor_location_mapping

//update partition for CompetitorShopresultsShopright

INSERT OVERWRITE TABLE stg_priceent_fnd.competitor_shopresults 
partition (publish_week_end_d, source_system_n)
select dpci                                 
,tcin                                 
,upc                                  
,brand_n                              
,product_desc                         
,department_id                        
,class_id                             
,item_id                              
,shop_begin_d                         
,shopped_crawl_utc_ts                 
,shop_crawl_d                         
,regular_retail_a                     
,offer_retail_a                       
,competitor_retail_a                  
,competitor_store_id                  
,source_referred_competitor_store_id  
,retailer_n                           
,retailer_short_n                     
,buy_box_winner_n                     
,buy_box_fulfiller_n                  
,newton_availability_c                
,audit_status_f                       
,regular_retail_uom                   
,regular_retail_q                     
,offer_retail_uom                     
,offer_retail_q                       
,scan_f                               
,inventory_availability_id            
,inventory_availability_desc          
,retail_data_availability_ind         
,retail_data_availability_short_desc  
,offer_retail_message_c               
,shop_comments                        
,shop_validity_f                      
,shop_result_id                       
,is_buy_box_winner_f                  
,is_buy_box_fulfiller_f               
,promo_message_t                      
,shop_list_id                         
,'2023-04-14T10:03:50Z' as publish_utc_ts                       
,market_strategy_relation_t           
,shop_information_flag                
,shop_item_frequency_c                
,price_exist_flag                     
,batch_load_ct_ts                     
,address_t                            
,city_n                               
,state_c                              
,zip_c                                
,data_provider_c                      
,shop_channel                         
,shop_week_end_d                      
,shop_week_n                          
,shop_end_d                           
,web_crawl_f                          
,retailer_chain_n                     
,store_number                         
,fulfillment_c                        
,sku                                  
,competitor_product_id                
,competitor_item_map_id               
,currency_c                           
,full_book_other_attributes_struct    
,digital_other_attributes_struct      
,store_other_attributes_struct        
,crawl_url                            
,'2023-04-14' as publish_d                            
,'2023-04-15' as publish_week_end_d                   
,source_system_n   
from stg_priceent_fnd.competitor_shopresults where publish_week_end_d = '2023-04-22' AND data_provider_c='NWS';