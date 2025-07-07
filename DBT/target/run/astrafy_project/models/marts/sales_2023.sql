
  
    

    create or replace table `astrafy-464919`.`marts`.`sales_2023`
      
    
    

    OPTIONS()
    as (
      --Since most of our requests require 2023 year filter, I decided to create a dedicated table to avoid repetitive filtering in each query.

SELECT 
    date_date,
    customer_id,
    order_id,
    products_id,
    net_sales,
    qty
FROM 
    `astrafy-464919`.`raw`.`sales_recrutement`
where 
    EXTRACT(YEAR FROM date_date) = 2023
    );
  