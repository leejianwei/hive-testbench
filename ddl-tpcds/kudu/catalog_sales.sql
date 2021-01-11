
drop table if exists catalog_sales;

create table catalog_sales
(
      cs_sold_date_sk bigint WITH (primary_key = true)
,     cs_item_sk bigint WITH (primary_key = true)
,     cs_order_number bigint WITH (primary_key = true)
,     cs_sold_time_sk bigint WITH (nullable = true)
,     cs_ship_date_sk bigint WITH (nullable = true)
,     cs_bill_customer_sk bigint WITH (nullable = true)
,     cs_bill_cdemo_sk bigint WITH (nullable = true)
,     cs_bill_hdemo_sk bigint WITH (nullable = true)
,     cs_bill_addr_sk bigint WITH (nullable = true)
,     cs_ship_customer_sk bigint WITH (nullable = true)
,     cs_ship_cdemo_sk bigint WITH (nullable = true)
,     cs_ship_hdemo_sk bigint WITH (nullable = true)
,     cs_ship_addr_sk bigint WITH (nullable = true)
,     cs_call_center_sk bigint WITH (nullable = true)
,     cs_catalog_page_sk bigint WITH (nullable = true)
,     cs_ship_mode_sk bigint WITH (nullable = true)
,     cs_warehouse_sk bigint WITH (nullable = true)
,     cs_promo_sk bigint WITH (nullable = true)
,     cs_quantity int WITH (nullable = true)
,     cs_wholesale_cost decimal(7,2) WITH (nullable = true)
,     cs_list_price decimal(7,2) WITH (nullable = true)
,     cs_sales_price decimal(7,2) WITH (nullable = true)
,     cs_ext_discount_amt decimal(7,2) WITH (nullable = true)
,     cs_ext_sales_price decimal(7,2) WITH (nullable = true)
,     cs_ext_wholesale_cost decimal(7,2) WITH (nullable = true)
,     cs_ext_list_price decimal(7,2) WITH (nullable = true)
,     cs_ext_tax decimal(7,2) WITH (nullable = true)
,     cs_coupon_amt decimal(7,2) WITH (nullable = true)
,     cs_ext_ship_cost decimal(7,2) WITH (nullable = true)
,     cs_net_paid decimal(7,2) WITH (nullable = true)
,     cs_net_paid_inc_tax decimal(7,2) WITH (nullable = true)
,     cs_net_paid_inc_ship decimal(7,2) WITH (nullable = true)
,     cs_net_paid_inc_ship_tax decimal(7,2) WITH (nullable = true)
,     cs_net_profit decimal(7,2) 
)
WITH (
  partition_by_range_columns = ARRAY['cs_sold_date_sk'],
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

insert into catalog_sales
select
        cs.cs_sold_date_sk,
        cs.cs_item_sk,
        cs.cs_order_number,
        cs.cs_sold_time_sk,
        cs.cs_ship_date_sk,
        cs.cs_bill_customer_sk,
        cs.cs_bill_cdemo_sk,
        cs.cs_bill_hdemo_sk,
        cs.cs_bill_addr_sk,
        cs.cs_ship_customer_sk,
        cs.cs_ship_cdemo_sk,
        cs.cs_ship_hdemo_sk,
        cs.cs_ship_addr_sk,
        cs.cs_call_center_sk,
        cs.cs_catalog_page_sk,
        cs.cs_ship_mode_sk,
        cs.cs_warehouse_sk,
        cs.cs_promo_sk,
        cs.cs_quantity,
        cs.cs_wholesale_cost,
        cs.cs_list_price,
        cs.cs_sales_price,
        cs.cs_ext_discount_amt,
        cs.cs_ext_sales_price,
        cs.cs_ext_wholesale_cost,
        cs.cs_ext_list_price,
        cs.cs_ext_tax,
        cs.cs_coupon_amt,
        cs.cs_ext_ship_cost,
        cs.cs_net_paid,
        cs.cs_net_paid_inc_tax,
        cs.cs_net_paid_inc_ship,
        cs.cs_net_paid_inc_ship_tax,
        cs.cs_net_profit
        from hive.tpcds_bin_partitioned_orc_1000.catalog_sales cs
        where cs.cs_sold_date_sk is not null;
