
drop table if exists time_dim;

create table time_dim
as select * from hive.tpcds_bin_partitioned_orc_2.time_dim;
