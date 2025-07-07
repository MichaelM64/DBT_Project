

  create or replace view `astrafy-464919`.`raw`.`exercice5`
  OPTIONS()
  as WITH sales_orders AS (
    SELECT
        customer_id,
        order_id,
        date_date,

        COUNTIF(date_date < s.date_date AND date_date >= DATE_SUB(s.date_date, INTERVAL 12 MONTH)) 
            OVER (PARTITION BY customer_id ORDER BY date_date ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) AS previous_12m_orders
    FROM `astrafy-464919`.`raw`.`sales_recrutement` AS s
    WHERE EXTRACT(YEAR FROM date_date) = 2023
)

SELECT
    order_id,
    customer_id,
    date_date,
    CASE
        WHEN previous_12m_orders = 0 THEN 'New'
        WHEN previous_12m_orders BETWEEN 1 AND 3 THEN 'Returning'
        WHEN previous_12m_orders >= 4 THEN 'VIP'
        ELSE 'unknown'
    END AS order_segment
FROM sales_orders;

