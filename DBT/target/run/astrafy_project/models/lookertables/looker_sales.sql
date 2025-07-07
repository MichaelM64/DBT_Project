
  
    

    create or replace table `astrafy-464919`.`marts`.`looker_sales`
      
    
    

    OPTIONS()
    as (
      -- The tables in the folder "lookertables" are used to create Looker views that consolidate the results of the SQL queries in the "marts" folder.
-- This table pulls data from the table "sales_recrutment" provided in the assignment, with the addition of the segmentation column.



SELECT
    date_date,
    customer_id,
    order_id,
    products_id,
    net_sales,
    qty,
    SUM(qty) OVER (PARTITION BY order_id, customer_id) AS total_order_qty
FROM
    `astrafy-464919`.`raw`.`sales_recrutement`
    );
  