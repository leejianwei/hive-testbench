

drop table if exists web_returns;

create table web_returns
(
      wr_returned_date_sk bigint WITH (primary_key = true)
,     wr_item_sk bigint WITH (primary_key = true)
,     wr_order_number bigint WITH (primary_key = true)
,     wr_returned_time_sk bigint WITH (nullable = true)
,     wr_refunded_customer_sk bigint WITH (nullable = true)
,     wr_refunded_cdemo_sk bigint WITH (nullable = true)
,     wr_refunded_hdemo_sk bigint WITH (nullable = true)
,     wr_refunded_addr_sk bigint WITH (nullable = true)
,     wr_returning_customer_sk bigint WITH (nullable = true)
,     wr_returning_cdemo_sk bigint WITH (nullable = true)
,     wr_returning_hdemo_sk bigint WITH (nullable = true)
,     wr_returning_addr_sk bigint WITH (nullable = true)
,     wr_web_page_sk bigint WITH (nullable = true)
,     wr_reason_sk bigint WITH (nullable = true)
,     wr_return_quantity int WITH (nullable = true)
,     wr_return_amt decimal(7,2) WITH (nullable = true)
,     wr_return_tax decimal(7,2) WITH (nullable = true)
,     wr_return_amt_inc_tax decimal(7,2) WITH (nullable = true)
,     wr_fee decimal(7,2) WITH (nullable = true)
,     wr_return_ship_cost decimal(7,2) WITH (nullable = true)
,     wr_refunded_cash decimal(7,2) WITH (nullable = true)
,     wr_reversed_charge decimal(7,2) WITH (nullable = true)
,     wr_account_credit decimal(7,2) WITH (nullable = true)
,     wr_net_loss decimal(7,2) WITH (nullable = true)
)
WITH (
  partition_by_range_columns = ARRAY['wr_returned_date_sk'],
  range_partitions = '[{"lower": null, "upper": 2450},
                       {"lower": 2450, "upper": 2451},
                       {"lower": 2451, "upper": 2452},
                       {"lower": 2452, "upper": null}]'
);


insert into web_returns
select
		wr.wr_returned_date_sk,
        wr.wr_item_sk,
        wr.wr_order_number,
        wr.wr_returned_time_sk,
        wr.wr_refunded_customer_sk,
        wr.wr_refunded_cdemo_sk,
        wr.wr_refunded_hdemo_sk,
        wr.wr_refunded_addr_sk,
        wr.wr_returning_customer_sk,
        wr.wr_returning_cdemo_sk,
        wr.wr_returning_hdemo_sk,
        wr.wr_returning_addr_sk,
        wr.wr_web_page_sk,
        wr.wr_reason_sk,
        wr.wr_return_quantity,
        wr.wr_return_amt,
        wr.wr_return_tax,
        wr.wr_return_amt_inc_tax,
        wr.wr_fee,
        wr.wr_return_ship_cost,
        wr.wr_refunded_cash,
        wr.wr_reversed_charge,
        wr.wr_account_credit,
        wr.wr_net_loss
        from hive.tpcds_bin_partitioned_orc_2.web_returns wr
        where wr.wr_returned_date_sk is not null
;
