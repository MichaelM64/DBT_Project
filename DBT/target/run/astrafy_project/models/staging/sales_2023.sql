

  create or replace view `astrafy-464919`.`marts_raw`.`sales_2023`
  OPTIONS()
  as SELECT 
    date_date,
    customer_id,
    order_id,
    products_id,
    net_sales,
    qty
FROM 
    `astrafy-464919`.`raw`.`sales_recrutement`
where 
    EXTRACT(YEAR FROM date_date) = 2023;

