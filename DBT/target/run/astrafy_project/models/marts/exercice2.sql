

  create or replace view `astrafy-464919`.`raw`.`exercice2`
  OPTIONS()
  as -- Materialized as a view


SELECT
  EXTRACT(MONTH FROM date_date) AS MONTH,
  COUNT(DISTINCT order_id) AS orders_count
FROM 
  `astrafy-464919`.`raw`.`sales_recrutement`
WHERE 
  EXTRACT(YEAR FROM date_date) = 2023
GROUP BY MONTH
ORDER BY MONTH;

