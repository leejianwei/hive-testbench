
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
  range_partitions = '[{"lower": null, "upper": 24501},
                       {"lower": 24501, "upper": 24502},
                       {"lower": 24502, "upper": 24503},
                       {"lower": 24503, "upper": 24504},
                       {"lower": 24504, "upper": 24505},
                       {"lower": 24505, "upper": 24506},
                       {"lower": 24506, "upper": 24507},
                       {"lower": 24507, "upper": 24508},
                       {"lower": 24508, "upper": 24509},
                       {"lower": 24509, "upper": 24510},
                       {"lower": 24510, "upper": 24511},
                       {"lower": 24511, "upper": 24512},
                       {"lower": 24512, "upper": 24513},
                       {"lower": 24513, "upper": 24514},
                       {"lower": 24514, "upper": 24515},
                       {"lower": 24515, "upper": 24516},
                       {"lower": 24516, "upper": 24517},
                       {"lower": 24517, "upper": 24518},
                       {"lower": 24518, "upper": 24519},
                       {"lower": 24519, "upper": 24520},
                       {"lower": 24520, "upper": 24521},
                       {"lower": 24521, "upper": 24522},
                       {"lower": 24522, "upper": 24523},
                       {"lower": 24523, "upper": 24524},
                       {"lower": 24524, "upper": 24525},
                       {"lower": 24525, "upper": 24526},
                       {"lower": 24526, "upper": 24527},
                       {"lower": 24527, "upper": 24528},
                       {"lower": 24528, "upper": 24529},
                       {"lower": 24529, "upper": null}]'
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
