

drop table if exists date_dim;


create table date_dim
as select * from hive.tpcds_bin_partitioned_orc_1000.date_dim;


CREATE TABLE date_dim2 (                     
    d_date_sk bigint WITH (primary_key = true),            
    d_date_id varchar WITH ( nullable = true ),           
    d_date varchar WITH ( nullable = true ),              
    d_month_seq integer WITH ( nullable = true ),         
    d_week_seq integer WITH ( nullable = true ),          
    d_quarter_seq integer WITH ( nullable = true ),       
    d_year integer WITH ( nullable = true ),              
    d_dow integer WITH ( nullable = true ),               
    d_moy integer WITH ( nullable = true ),               
    d_dom integer WITH ( nullable = true ),               
    d_qoy integer WITH ( nullable = true ),               
    d_fy_year integer WITH ( nullable = true ),           
    d_fy_quarter_seq integer WITH ( nullable = true ),    
    d_fy_week_seq integer WITH ( nullable = true ),       
    d_day_name varchar WITH ( nullable = true ),          
    d_quarter_name varchar WITH ( nullable = true ),      
    d_holiday varchar WITH ( nullable = true ),           
    d_weekend varchar WITH ( nullable = true ),           
    d_following_holiday varchar WITH ( nullable = true ), 
    d_first_dom integer WITH ( nullable = true ),         
    d_last_dom integer WITH ( nullable = true ),          
    d_same_day_ly integer WITH ( nullable = true ),       
    d_same_day_lq integer WITH ( nullable = true ),       
    d_current_day varchar WITH ( nullable = true ),       
    d_current_week varchar WITH ( nullable = true ),      
    d_current_month varchar WITH ( nullable = true ),     
    d_current_quarter varchar WITH ( nullable = true ),   
    d_current_year varchar WITH ( nullable = true )       
 )                                                        
 WITH (                                                   
    number_of_replicas = 3,                               
    partition_by_hash_buckets = 2,                        
    partition_by_hash_columns = ARRAY['d_date_sk']   
 );


insert into date_dim2 
select * from hive.tpcds_bin_partitioned_orc_1000.date_dim;

