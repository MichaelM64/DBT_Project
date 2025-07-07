

  create or replace view `astrafy-464919`.`raw`.`exercice3`
  OPTIONS()
  as SELECT
  format_date('%B - %Y', date_trunc(CAST(date_date AS DATE), MONTH)) AS month_year,
  COUNT(*) AS total_products,
  COUNT(DISTINCT order_id) AS total_orders,
  ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT order_id), 2) AS avg_products_per_order
FROM `astrafy-464919`.`raw`.`sales_recrutement`
WHERE extract(year from cast(date_date as date)) = 2023
GROUP BY month_year, date_trunc(CAST(date_date AS DATE), MONTH)
ORDER BY DATE_TRUNC(CAST(date_date AS DATE), MONTH);

