

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
