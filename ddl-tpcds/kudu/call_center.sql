
drop table if exists call_center;

create table call_center
as select * from hive.tpcds_bin_partitioned_orc_2.call_center;
