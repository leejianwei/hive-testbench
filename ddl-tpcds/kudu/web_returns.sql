

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
        from hive.tpcds_bin_partitioned_orc_1000.web_returns wr
        where wr.wr_returned_date_sk is not null
;
