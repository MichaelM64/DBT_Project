-- The tables in the folder "lookertables" are used to create Looker views that consolidate the results of the SQL queries in the "marts" folder.
-- This table pulls data from the table "orders_recrutment" provided in the assignment, with the addition of the segmentation column.

{{ config(materialized='table') }}

WITH orders AS (
    SELECT
        date_date,
        customers_id,
        orders_id,
        net_sales,
        COUNT(*) OVER (
            PARTITION BY customers_id
            ORDER BY date_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
        ) AS previous_orders
    FROM 
        {{ source('raw', 'orders_recrutement') }}
)

SELECT
    date_date,
    customers_id,
    orders_id,
    net_sales,
    CASE
        WHEN previous_orders = 0 THEN 'New'
        WHEN previous_orders BETWEEN 1 AND 3 THEN 'Returning'
        WHEN previous_orders >= 4 THEN 'VIP'
        ELSE 'Unknown' --shouldn't happen, but good to have a fallback
    END AS order_segmentation
FROM orders