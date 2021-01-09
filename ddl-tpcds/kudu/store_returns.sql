

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

