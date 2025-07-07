--Create a table (1 line per order) for all orders in the year 2022 and 2023 with a qty_product column that gives the total quantity of products in the order

{{ config(materialized='table') }}
SELECT
  MIN(CAST(date_date AS DATE)) AS order_date,
  MIN(customer_id) AS customer_id,
  order_id,
  ROUND(SUM(net_sales),2) AS net_sales,
  SUM(qty) AS qty_product
FROM 
  {{ source('raw', 'sales_recrutement') }}

WHERE 
  EXTRACT(YEAR FROM CAST(date_date AS DATE)) IN (2022, 2023)

GROUP BY order_id
ORDER BY order_date