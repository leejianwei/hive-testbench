
drop table if exists inventory;

create table inventory
as select * from hive.tpcds_bin_partitioned_orc_1000.inventory;