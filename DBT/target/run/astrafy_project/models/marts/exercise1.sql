

  create or replace view `astrafy-464919`.`marts`.`exercise1`
  OPTIONS()
  as --Number of orders in the year 2023
SELECT
  COUNT(DISTINCT order_id) AS order_count_2023
FROM 
    `astrafy-464919`.`marts`.`sales_2023`;

