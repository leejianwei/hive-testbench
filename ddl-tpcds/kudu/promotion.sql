
drop table if exists promotion;

create table promotion
as select * from hive.tpcds_bin_partitioned_orc_2.promotion;
