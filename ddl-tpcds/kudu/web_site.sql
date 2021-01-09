
drop table if exists web_site;

create table web_site
as select * from hive.tpcds_bin_partitioned_orc_1000.web_site;
