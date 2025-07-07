WITH orders AS (
  SELECT * FROM `astrafy-464919`.`raw`.`sales_recrutement`
  WHERE EXTRACT(YEAR FROM date_date) IN (2022, 2023)
),

order_seg AS (
  SELECT * FROM `astrafy-464919`.`marts`.`exercise5`
)

SELECT
  o.*,
  s.order_segment
FROM orders o
LEFT JOIN order_seg s ON o.order_id = s.order_id