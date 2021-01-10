
drop table if exists catalog_returns;

create table catalog_returns(
      cr_returned_date_sk bigint WITH (primary_key = true),     
      cr_item_sk bigint WITH (primary_key = true),
      cr_order_number bigint WITH (primary_key = true)
,     cr_returned_time_sk bigint WITH (nullable = true)
,     cr_refunded_customer_sk bigint WITH (nullable = true)
,     cr_refunded_cdemo_sk bigint WITH (nullable = true)
,     cr_refunded_hdemo_sk bigint WITH (nullable = true)
,     cr_refunded_addr_sk bigint WITH (nullable = true)
,     cr_returning_customer_sk bigint WITH (nullable = true)
,     cr_returning_cdemo_sk bigint WITH (nullable = true)
,     cr_returning_hdemo_sk bigint WITH (nullable = true)
,     cr_returning_addr_sk bigint WITH (nullable = true)
,     cr_call_center_sk bigint WITH (nullable = true)
,     cr_catalog_page_sk bigint WITH (nullable = true)
,     cr_ship_mode_sk bigint WITH (nullable = true)
,     cr_warehouse_sk bigint WITH (nullable = true)
,     cr_reason_sk bigint WITH (nullable = true)
,     cr_return_quantity int WITH (nullable = true)
,     cr_return_amount decimal(7,2) WITH (nullable = true)
,     cr_return_tax decimal(7,2) WITH (nullable = true)
,     cr_return_amt_inc_tax decimal(7,2) WITH (nullable = true)
,     cr_fee decimal(7,2) WITH (nullable = true)
,     cr_return_ship_cost decimal(7,2) WITH (nullable = true)
,     cr_refunded_cash decimal(7,2) WITH (nullable = true)
,     cr_reversed_charge decimal(7,2) WITH (nullable = true)
,     cr_store_credit decimal(7,2) WITH (nullable = true)
,     cr_net_loss decimal(7,2) WITH (nullable = true)
)
WITH (
  partition_by_range_columns = ARRAY['cr_returned_date_sk'],
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

insert into catalog_returns
select
        cr.cr_returned_date_sk,
        cr.cr_item_sk,
        cr.cr_order_number,
        cr.cr_returned_time_sk,
        cr.cr_refunded_customer_sk,
        cr.cr_refunded_cdemo_sk,
        cr.cr_refunded_hdemo_sk,
        cr.cr_refunded_addr_sk,
        cr.cr_returning_customer_sk,
        cr.cr_returning_cdemo_sk,
        cr.cr_returning_hdemo_sk,
        cr.cr_returning_addr_sk,
        cr.cr_call_center_sk,
        cr.cr_catalog_page_sk,
        cr.cr_ship_mode_sk,
        cr.cr_warehouse_sk,
        cr.cr_reason_sk,
        cr.cr_return_quantity,
        cr.cr_return_amount,
        cr.cr_return_tax,
        cr.cr_return_amt_inc_tax,
        cr.cr_fee,
        cr.cr_return_ship_cost,
        cr.cr_refunded_cash,
        cr.cr_reversed_charge,
        cr.cr_store_credit,
        cr.cr_net_loss
      from hive.tpcds_bin_partitioned_orc_1000.catalog_returns cr
      where cr.cr_returned_date_sk is not null;
