

drop table if exists web_sales;

create table web_sales
(
    ws_sold_date_sk bigint WITH (primary_key = true),
    ws_item_sk                bigint WITH (primary_key = true),
    ws_order_number           bigint WITH (primary_key = true),
    ws_sold_time_sk           bigint WITH (nullable = true),
    ws_ship_date_sk           bigint WITH (nullable = true),
    ws_bill_customer_sk       bigint WITH (nullable = true),
    ws_bill_cdemo_sk          bigint WITH (nullable = true),
    ws_bill_hdemo_sk          bigint WITH (nullable = true),
    ws_bill_addr_sk           bigint WITH (nullable = true),
    ws_ship_customer_sk       bigint WITH (nullable = true),
    ws_ship_cdemo_sk          bigint WITH (nullable = true),
    ws_ship_hdemo_sk          bigint WITH (nullable = true),
    ws_ship_addr_sk           bigint WITH (nullable = true),
    ws_web_page_sk            bigint WITH (nullable = true),
    ws_web_site_sk            bigint WITH (nullable = true),
    ws_ship_mode_sk           bigint WITH (nullable = true),
    ws_warehouse_sk           bigint WITH (nullable = true),
    ws_promo_sk               bigint WITH (nullable = true),
    ws_quantity               int WITH (nullable = true),
    ws_wholesale_cost         decimal(7,2) WITH (nullable = true),
    ws_list_price             decimal(7,2) WITH (nullable = true),
    ws_sales_price            decimal(7,2) WITH (nullable = true),
    ws_ext_discount_amt       decimal(7,2) WITH (nullable = true),
    ws_ext_sales_price        decimal(7,2) WITH (nullable = true),
    ws_ext_wholesale_cost     decimal(7,2) WITH (nullable = true),
    ws_ext_list_price         decimal(7,2) WITH (nullable = true),
    ws_ext_tax                decimal(7,2) WITH (nullable = true),
    ws_coupon_amt             decimal(7,2) WITH (nullable = true),
    ws_ext_ship_cost          decimal(7,2) WITH (nullable = true),
    ws_net_paid               decimal(7,2) WITH (nullable = true),
    ws_net_paid_inc_tax       decimal(7,2) WITH (nullable = true),
    ws_net_paid_inc_ship      decimal(7,2) WITH (nullable = true),
    ws_net_paid_inc_ship_tax  decimal(7,2) WITH (nullable = true),
    ws_net_profit             decimal(7,2) WITH (nullable = true)
)
WITH (
  partition_by_range_columns = ARRAY['ws_sold_date_sk'],
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


insert into web_sales
select
        ws.ws_sold_date_sk,
        ws.ws_item_sk,
        ws.ws_order_number,
        ws.ws_sold_time_sk,
        ws.ws_ship_date_sk,
        ws.ws_bill_customer_sk,
        ws.ws_bill_cdemo_sk,
        ws.ws_bill_hdemo_sk,
        ws.ws_bill_addr_sk,
        ws.ws_ship_customer_sk,
        ws.ws_ship_cdemo_sk,
        ws.ws_ship_hdemo_sk,
        ws.ws_ship_addr_sk,
        ws.ws_web_page_sk,
        ws.ws_web_site_sk,
        ws.ws_ship_mode_sk,
        ws.ws_warehouse_sk,
        ws.ws_promo_sk,
        ws.ws_quantity,
        ws.ws_wholesale_cost,
        ws.ws_list_price,
        ws.ws_sales_price,
        ws.ws_ext_discount_amt,
        ws.ws_ext_sales_price,
        ws.ws_ext_wholesale_cost,
        ws.ws_ext_list_price,
        ws.ws_ext_tax,
        ws.ws_coupon_amt,
        ws.ws_ext_ship_cost,
        ws.ws_net_paid,
        ws.ws_net_paid_inc_tax,
        ws.ws_net_paid_inc_ship,
        ws.ws_net_paid_inc_ship_tax,
        ws.ws_net_profit
        from hive.tpcds_bin_partitioned_orc_1000.web_sales ws
        where ws.ws_sold_date_sk is not null
;
