

  create or replace view `astrafy-464919`.`raw`.`orders_per_month_2023`
  OPTIONS()
  as 

select
  extract(month from date_date) as month,
  count(distinct order_id) as orders_count
from `astrafy-464919`.`raw`.`sales_recrutement`
where extract(year from date_date) = 2023
group by month
order by month;

