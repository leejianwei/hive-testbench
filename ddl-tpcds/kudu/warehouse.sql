
drop table if exists warehouse;

create table warehouse
as select * from hive.tpcds_bin_partitioned_orc_1000.warehouse;
