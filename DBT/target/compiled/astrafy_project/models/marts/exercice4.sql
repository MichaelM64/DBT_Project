SELECT
  order_id,
  MIN(CAST(date_date AS DATE)) AS order_date,
  MIN(customer_id) AS customer_id,
  SUM(qty) AS qty_product
FROM `astrafy-464919`.`raw`.`sales_recrutement`
where EXTRACT(year from CAST(date_date AS DATE)) in (2022, 2023)
GROUP BY order_id