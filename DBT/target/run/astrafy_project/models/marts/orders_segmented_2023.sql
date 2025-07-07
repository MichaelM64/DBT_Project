

  create or replace view `astrafy-464919`.`raw`.`orders_segmented_2023`
  OPTIONS()
  as with orders as (
  select * from `astrafy-464919`.`raw`.`sales_recrutement`
  where extract(year from date_date) in (2022, 2023)
),

order_seg as (
  select * from `astrafy-464919`.`raw`.`order_segmentation`
)

select
  o.*,
  s.order_segment
from orders o
left join order_seg s on o.order_id = s.order_id;

