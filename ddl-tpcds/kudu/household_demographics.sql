drop table if exists household_demographics;

create table household_demographics
as select * from hive.tpcds_bin_partitioned_orc_1000.household_demographics;
