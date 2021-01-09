

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
  range_partitions = '[{"lower": null, "upper": 2450},
                       {"lower": 2450, "upper": 2451},
                       {"lower": 2451, "upper": 2452},
                       {"lower": 2452, "upper": null}]'
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
        from hive.tpcds_bin_partitioned_orc_2.store_returns sr 
        where sr.sr_returned_date_sk is not null;

