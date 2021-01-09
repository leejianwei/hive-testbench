
drop table if exists reason;

create table reason
as select * from hive.tpcds_bin_partitioned_orc_1000.reason;
