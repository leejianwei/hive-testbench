
drop table if exists customer_demographics;

create table customer_demographics
as select * from hive.tpcds_bin_partitioned_orc_2.customer_demographics;
