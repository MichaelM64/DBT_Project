

  create or replace view `astrafy-464919`.`raw`.`total_orders_2023`
  OPTIONS()
  as -- by default materialized as a view


select
  count(distinct order_id) as order_count_2023
from `astrafy-464919`.`raw`.`sales_recrutement`
where extract(year from date_date) = 2023;

