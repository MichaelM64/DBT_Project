--Average number of products per order for each month of the year 2023
WITH base AS (
  SELECT
    DATE_TRUNC(date_date, MONTH) AS month_start, --selects the first day of the month for each date
    order_id
  FROM {{ ref('sales_2023') }}
)

SELECT
  FORMAT_DATE('%B - %Y', month_start) AS month_year,
  COUNT(*) AS total_products,
  COUNT(DISTINCT order_id) AS total_orders,
  ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT order_id), 2) AS avg_products_per_order
FROM base
GROUP BY month_start
ORDER BY month_start

