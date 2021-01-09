
drop table if exists store_sales;

create table store_sales
(
      ss_sold_date_sk bigint WITH (primary_key = true)
,     ss_item_sk bigint WITH (primary_key = true)
,     ss_ticket_number bigint WITH (primary_key = true)
,     ss_sold_time_sk bigint WITH (nullable = true)
,     ss_customer_sk bigint WITH (nullable = true)
,     ss_cdemo_sk bigint WITH (nullable = true)
,     ss_hdemo_sk bigint WITH (nullable = true)
,     ss_addr_sk bigint WITH (nullable = true)
,     ss_store_sk bigint WITH (nullable = true)
,     ss_promo_sk bigint WITH (nullable = true)
,     ss_quantity int WITH (nullable = true)
,     ss_wholesale_cost decimal(7,2) WITH (nullable = true)
,     ss_list_price decimal(7,2) WITH (nullable = true)
,     ss_sales_price decimal(7,2) WITH (nullable = true)
,     ss_ext_discount_amt decimal(7,2) WITH (nullable = true)
,     ss_ext_sales_price decimal(7,2) WITH (nullable = true)
,     ss_ext_wholesale_cost decimal(7,2) WITH (nullable = true)
,     ss_ext_list_price decimal(7,2) WITH (nullable = true)
,     ss_ext_tax decimal(7,2) WITH (nullable = true)
,     ss_coupon_amt decimal(7,2) WITH (nullable = true)
,     ss_net_paid decimal(7,2) WITH (nullable = true)
,     ss_net_paid_inc_tax decimal(7,2) WITH (nullable = true)
,     ss_net_profit decimal(7,2) WITH (nullable = true)
)
WITH (
  partition_by_range_columns = ARRAY['ss_sold_date_sk'],
  range_partitions = '[{"lower": null, "upper": 2450},
                       {"lower": 2450, "upper": 2451},
                       {"lower": 2451, "upper": 2452},
                       {"lower": 2452, "upper": null}]'
);



insert into store_sales
select
        ss.ss_sold_date_sk,
        ss.ss_item_sk,
        ss.ss_ticket_number,
        ss.ss_sold_time_sk,
        ss.ss_customer_sk,
        ss.ss_cdemo_sk,
        ss.ss_hdemo_sk,
        ss.ss_addr_sk,
        ss.ss_store_sk,
        ss.ss_promo_sk,
        ss.ss_quantity,
        ss.ss_wholesale_cost,
        ss.ss_list_price,
        ss.ss_sales_price,
        ss.ss_ext_discount_amt,
        ss.ss_ext_sales_price,
        ss.ss_ext_wholesale_cost,
        ss.ss_ext_list_price,
        ss.ss_ext_tax,
        ss.ss_coupon_amt,
        ss.ss_net_paid,
        ss.ss_net_paid_inc_tax,
        ss.ss_net_profit
        from hive.tpcds_bin_partitioned_orc_1000.store_sales ss
        where ss.ss_sold_date_sk is not null
;
