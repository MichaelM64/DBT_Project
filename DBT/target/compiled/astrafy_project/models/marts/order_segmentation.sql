with sales_orders as (
    select
        customer_id,
        order_id,
        date_date,

        countif(date_date < s.date_date and date_date >= date_sub(s.date_date, interval 12 month)) 
            over (partition by customer_id order by date_date rows between unbounded preceding and 1 preceding) as previous_12m_orders
    from `astrafy-464919`.`raw`.`sales_recrutement` as s
    where extract(year from date_date) = 2023
)

select
    order_id,
    customer_id,
    date_date,
    case
        when previous_12m_orders = 0 then 'new'
        when previous_12m_orders between 1 and 3 then 'returning'
        when previous_12m_orders >= 4 then 'vip'
        else 'unknown'
    end as order_segment
from sales_orders