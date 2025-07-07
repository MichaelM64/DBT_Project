view: sales {
  sql_table_name: `astrafy-464919.marts.looker_products` ;;

  dimension: date_date {
    type: date
    sql: ${TABLE}.date_date ;;
    label: "Order Date"
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
    label: "Customer ID"
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
    label: "Order ID"
  }

  dimension: products_id {
    type: number
    sql: ${TABLE}.products_id ;;
    label: "Product ID"
  }

  measure: net_sales {
    type: sum
    sql: ${TABLE}.net_sales ;;
    value_format_name: "usd"
    label: "Net Sale (USD)"
  }

  measure: quantity {
    type: sum
    sql: ${TABLE}.qty ;;
    label: "Total Quantity"
  }

# ====== Measures ======
  measure: product_count {
    type: count
    sql: ${TABLE}.products_id ;;
    label: "Number of Products"
  }
  measure: avg_products_per_order {
    type: number
    sql: COUNT(*) * 1.0 / NULLIF(COUNT(DISTINCT ${order_id}), 0) ;;
    value_format_name: "decimal_2"
    label: "Average Products per Order"
}

  measure: order_count {
    type: count_distinct
    sql: ${TABLE}.order_id ;;
    label: "Number of Orders"
  }

  measure: customer_count {
    type: count_distinct
    sql: ${TABLE}.customer_id ;;
    label: "Number of Customers"
  }
}
