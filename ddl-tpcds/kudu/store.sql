
drop table if exists store;

create table store
as select * from hive.tpcds_bin_partitioned_orc_1000.store;
