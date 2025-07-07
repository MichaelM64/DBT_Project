

  create or replace view `astrafy-464919`.`raw`.`exercice1`
  OPTIONS()
  as -- Materialized as a view



SELECT
  count(DISTINCT order_id) AS order_count_2023
FROM 
  `astrafy-464919`.`raw`.`sales_recrutement`
WHERE 
  EXTRACT(YEAR FROM date_date) = 2023;

