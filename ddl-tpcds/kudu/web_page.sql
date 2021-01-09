
drop table if exists web_page;

create table web_page
as select * from hive.tpcds_bin_partitioned_orc_1000.web_page;
