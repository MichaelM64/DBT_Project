

  create or replace view `astrafy-464919`.`raw`.`orders_with_products`
  OPTIONS()
  as select
  order_id,
  min(cast(date_date as date)) as order_date,
  min(customer_id) as customer_id,
  sum(qty) as qty_product
from `astrafy-464919`.`raw`.`sales_recrutement`
where extract(year from cast(date_date as date)) in (2022, 2023)
group by order_id;

