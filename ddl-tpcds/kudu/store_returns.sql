

drop table if exists store_returns;

create table store_returns
(
      sr_returned_date_sk bigint WITH (primary_key = true)
,     sr_item_sk bigint WITH (primary_key = true)
,     sr_ticket_number bigint WITH (primary_key = true)
,     sr_return_time_sk bigint WITH (nullable = true)
,     sr_customer_sk bigint WITH (nullable = true)
,     sr_cdemo_sk bigint WITH (nullable = true)
,     sr_hdemo_sk bigint WITH (nullable = true)
,     sr_addr_sk bigint WITH (nullable = true)
,     sr_store_sk bigint WITH (nullable = true)
,     sr_reason_sk bigint WITH (nullable = true)
,     sr_return_quantity int WITH (nullable = true)
,     sr_return_amt decimal(7,2) WITH (nullable = true)
,     sr_return_tax decimal(7,2) WITH (nullable = true)
,     sr_return_amt_inc_tax decimal(7,2) WITH (nullable = true)
,     sr_fee decimal(7,2) WITH (nullable = true)
,     sr_return_ship_cost decimal(7,2) WITH (nullable = true)
,     sr_refunded_cash decimal(7,2) WITH (nullable = true)
,     sr_reversed_charge decimal(7,2) WITH (nullable = true)
,     sr_store_credit decimal(7,2) WITH (nullable = true)
,     sr_net_loss decimal(7,2) WITH (nullable = true)
)
WITH (
  partition_by_range_columns = ARRAY['sr_returned_date_sk'],
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

insert into store_returns
select
        sr.sr_returned_date_sk,
        sr.sr_item_sk,
        sr.sr_ticket_number,
        sr.sr_return_time_sk,
        sr.sr_customer_sk,
        sr.sr_cdemo_sk,
        sr.sr_hdemo_sk,
        sr.sr_addr_sk,
        sr.sr_store_sk,
        sr.sr_reason_sk,
        sr.sr_return_quantity,
        sr.sr_return_amt,
        sr.sr_return_tax,
        sr.sr_return_amt_inc_tax,
        sr.sr_fee,
        sr.sr_return_ship_cost,
        sr.sr_refunded_cash,
        sr.sr_reversed_charge,
        sr.sr_store_credit,
        sr.sr_net_loss
        from hive.tpcds_bin_partitioned_orc_1000.store_returns sr 
        where sr.sr_returned_date_sk is not null;

