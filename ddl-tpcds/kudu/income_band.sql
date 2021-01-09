drop table if exists income_band;

create table income_band
as select * from hive.tpcds_bin_partitioned_orc_2.income_band;
