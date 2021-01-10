
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
  range_partitions = '[{"lower": null, "upper": 2450100},
                       {"lower": 2450100, "upper": 2450200},
                       {"lower": 2450200, "upper": 2450300},
                       {"lower": 2450300, "upper": 2450400},
                       {"lower": 2450400, "upper": 2450500},
                       {"lower": 2450500, "upper": 2450600},
                       {"lower": 2450600, "upper": 2450700},
                       {"lower": 2450700, "upper": 2450800},
                       {"lower": 2450800, "upper": 2450900},
                       {"lower": 2450900, "upper": 2451000},
                       {"lower": 2451000, "upper": 2451100},
                       {"lower": 2451100, "upper": 2451200},
                       {"lower": 2451200, "upper": 2451300},
                       {"lower": 2451300, "upper": 2451400},
                       {"lower": 2451400, "upper": 2451500},
                       {"lower": 2451500, "upper": 2451600},
                       {"lower": 2451600, "upper": 2451700},
                       {"lower": 2451700, "upper": 2451800},
                       {"lower": 2451800, "upper": 2451900},
                       {"lower": 2451900, "upper": 2452000},
                       {"lower": 2452000, "upper": 2452100},
                       {"lower": 2452100, "upper": 2452200},
                       {"lower": 2452200, "upper": 2452300},
                       {"lower": 2452300, "upper": 2452400},
                       {"lower": 2452400, "upper": 2452500},
                       {"lower": 2452500, "upper": 2452600},
                       {"lower": 2452600, "upper": 2452700},
                       {"lower": 2452700, "upper": 2452800},
                       {"lower": 2452800, "upper": 2452900},
                       {"lower": 2452900, "upper": null}]'
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
