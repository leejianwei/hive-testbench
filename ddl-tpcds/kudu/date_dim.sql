

drop table if exists date_dim;

create table date_dim
as select * from hive.tpcds_bin_partitioned_orc_2.date_dim;
