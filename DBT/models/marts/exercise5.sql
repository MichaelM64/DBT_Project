--New: it's the 1st order of the customer (client_id) in the past 12 months.
--Returning: it's between the 2nd and the 4th order of the customer in the past 12 months
--VIP: it's the 5th order or more of the customer in the past 12 months
--Calculate it for each order in the year 2023

--Excercise 6 is basically the same as excercise 5, I materialized it as a table because it explicitly asks for a table with the segmentation of orders.
{{ config(materialized='table') }}

WITH orders_2023 AS (
    SELECT
        customers_id,
        orders_id,
        date_date,

        COUNT(*) OVER (
            PARTITION BY customers_id
            ORDER BY date_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
        ) AS previous_orders
    FROM 
        {{ source('raw', 'orders_recrutement') }}
    WHERE EXTRACT(YEAR FROM date_date) = 2023
)

SELECT
    orders_id,
    customers_id,
    date_date,
    CASE
        WHEN previous_orders = 0 THEN 'New'
        WHEN previous_orders BETWEEN 1 AND 3 THEN 'Returning'
        WHEN previous_orders >= 4 THEN 'VIP'
        ELSE 'Unknown' --shouldn't happen, but good to have a fallback
    END AS order_segmentation
FROM orders_2023

