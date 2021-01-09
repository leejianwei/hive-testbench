

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
  range_partitions = '[{"lower": null, "upper": 2450},
                       {"lower": 2450, "upper": 2451},
                       {"lower": 2451, "upper": 2452},
                       {"lower": 2452, "upper": null}]'
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
