
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
  range_partitions = '[{"lower": null, "upper": 2450000},
{"lower": 2450000 , "upper":  2450050 },
{"lower": 2450050 , "upper":  2450100 },
{"lower": 2450100 , "upper":  2450150 },
{"lower": 2450150 , "upper":  2450200 },
{"lower": 2450200 , "upper":  2450250 },
{"lower": 2450250 , "upper":  2450300 },
{"lower": 2450300 , "upper":  2450350 },
{"lower": 2450350 , "upper":  2450400 },
{"lower": 2450400 , "upper":  2450450 },
{"lower": 2450450 , "upper":  2450500 },
{"lower": 2450500 , "upper":  2450550 },
{"lower": 2450550 , "upper":  2450600 },
{"lower": 2450600 , "upper":  2450650 },
{"lower": 2450650 , "upper":  2450700 },
{"lower": 2450700 , "upper":  2450750 },
{"lower": 2450750 , "upper":  2450800 },
{"lower": 2450800 , "upper":  2450850 },
{"lower": 2450850 , "upper":  2450900 },
{"lower": 2450900 , "upper":  2450950 },
{"lower": 2450950 , "upper":  2451000 },
{"lower": 2451000 , "upper":  2451050 },
{"lower": 2451050 , "upper":  2451100 },
{"lower": 2451100 , "upper":  2451150 },
{"lower": 2451150 , "upper":  2451200 },
{"lower": 2451200 , "upper":  2451250 },
{"lower": 2451250 , "upper":  2451300 },
{"lower": 2451300 , "upper":  2451350 },
{"lower": 2451350 , "upper":  2451400 },
{"lower": 2451400 , "upper":  2451450 },
{"lower": 2451450 , "upper":  2451500 },
{"lower": 2451500 , "upper":  2451550 },
{"lower": 2451550 , "upper":  2451600 },
{"lower": 2451600 , "upper":  2451650 },
{"lower": 2451650 , "upper":  2451700 },
{"lower": 2451700 , "upper":  2451750 },
{"lower": 2451750 , "upper":  2451800 },
{"lower": 2451800 , "upper":  2451850 },
{"lower": 2451850 , "upper":  2451900 },
{"lower": 2451900 , "upper":  2451950 },
{"lower": 2451950 , "upper":  2452000 },
{"lower": 2452000 , "upper":  2452050 },
{"lower": 2452050 , "upper":  2452100 },
{"lower": 2452100 , "upper":  2452150 },
{"lower": 2452150 , "upper":  2452200 },
{"lower": 2452200 , "upper":  2452250 },
{"lower": 2452250 , "upper":  2452300 },
{"lower": 2452300 , "upper":  2452350 },
{"lower": 2452350 , "upper":  2452400 },
{"lower": 2452400 , "upper":  2452450 },
{"lower": 2452450 , "upper":  2452500 },
{"lower": 2452500 , "upper":  2452550 },
{"lower": 2452550 , "upper":  2452600 },
{"lower": 2452600 , "upper":  2452650 },
{"lower": 2452650 , "upper":  2452700 },
{"lower": 2452700 , "upper":  2452750 },
{"lower": 2452750 , "upper":  2452800 },
{"lower": 2452800 , "upper":  2452850 },
{"lower": 2452850 , "upper":  2452900 },
{"lower": 2452900 , "upper":  2452950 },
{"lower": 2452950 , "upper":  2453000 },
                       {"lower": 2453000, "upper": null}]'
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
