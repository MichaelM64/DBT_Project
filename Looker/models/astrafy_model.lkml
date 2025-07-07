# Since I don't have access to a looker instance, I didnt set up the connection.
connection: "pending_connection"

# Includes all of the view files in the views folder
include: "/views/*.view.lkml"

# Explore definition (Pending)
explore: sales {
  label: "Sales and Orders Analytics"
  join: orders {
    sql_on: ${orders.orders_id} = ${sales.order_id} ;;
    relationship: many_to_one
  }
}