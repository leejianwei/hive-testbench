
drop table if exists ship_mode;

create table ship_mode
as select * from hive.tpcds_bin_partitioned_orc_2.ship_mode;
