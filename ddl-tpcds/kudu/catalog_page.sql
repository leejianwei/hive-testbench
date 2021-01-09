
drop table if exists catalog_page;

create table catalog_page
as select * from hive.tpcds_bin_partitioned_orc_1000.catalog_page;
