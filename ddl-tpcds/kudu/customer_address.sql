
drop table if exists customer_address;

create table customer_address
as select * from hive.tpcds_bin_partitioned_orc_2.customer_address;
