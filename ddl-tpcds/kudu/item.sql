drop table if exists item;

create table item
as select * from hive.tpcds_bin_partitioned_orc_1000.item;
