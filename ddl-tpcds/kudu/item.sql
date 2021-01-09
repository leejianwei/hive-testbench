drop table if exists item;

create table item
as select * from hive.tpcds_bin_partitioned_orc_2.item;
