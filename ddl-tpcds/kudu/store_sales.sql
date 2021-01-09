
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
