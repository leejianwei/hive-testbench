
drop table if exists web_site;

create table web_site
as select * from hive.tpcds_bin_partitioned_orc_2.web_site;
