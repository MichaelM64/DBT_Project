view: orders {
  sql_table_name: `astrafy-464919.marts.looker_orders` ;;

  dimension: date_date {
    type: date
    sql: ${TABLE}.date_date ;;
    label: "Order Date"
  }

  dimension: customers_id {
    type: number
    sql: ${TABLE}.customers_id ;;
    label: "Customer ID"
  }

  dimension: orders_id {
    type: number
    sql: ${TABLE}.orders_id ;;
    primary_key: yes
    label: "Order ID"
  }

  dimension: order_segmentation {
    type: string
    sql: ${TABLE}.order_segmentation ;;
    label: "Order Segmentation"
  }

  measure: net_sales {
    type: sum
    sql: ${TABLE}.net_sales ;;
    value_format_name: "usd"
    label: "Total Order Net Sales (USD)"
  }
# ====== Measures ======
  measure: orders_count {
    type: count
    sql: ${TABLE}.orders_id ;;
    label: "Orders Count"
  }
  
  measure: customers_count {
        type: count_distinct
        sql: ${TABLE}.customers_id ;;
        label: "Total Customers"
    }
}
