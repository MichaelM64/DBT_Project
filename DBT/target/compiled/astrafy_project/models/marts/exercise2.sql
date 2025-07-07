--Number of orders per month in the year 2023
SELECT
  EXTRACT(MONTH FROM date_date) AS month,
  COUNT(DISTINCT order_id) AS orders_count

FROM 
  `astrafy-464919`.`marts`.`sales_2023`

GROUP BY MONTH
ORDER BY MONTH