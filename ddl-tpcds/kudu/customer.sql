drop table if exists customer;

create table customer
as select * from hive.tpcds_bin_partitioned_orc_1000.customer;
