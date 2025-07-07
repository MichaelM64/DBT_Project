

  create or replace view `astrafy-464919`.`raw`.`avg_products_per_order_2023`
  OPTIONS()
  as select
  format_date('%B - %Y', date_trunc(cast(date_date as date), month)) as month_year,
  count(*) as total_products,
  count(distinct order_id) as total_orders,
  round(count(*) * 1.0 / count(distinct order_id), 2) as avg_products_per_order
from `astrafy-464919`.`raw`.`sales_recrutement`
where extract(year from cast(date_date as date)) = 2023
group by month_year, date_trunc(cast(date_date as date), month)
order by date_trunc(cast(date_date as date), month);

