
drop table if exists time_dim;

create table time_dim
as select * from hive.tpcds_bin_partitioned_orc_1000.time_dim;
