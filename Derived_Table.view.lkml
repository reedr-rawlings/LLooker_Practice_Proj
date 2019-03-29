view: derived_table {
  derived_table: {
    sql: SELECT orders.*,
    order_items.id AS order_item_id,
    order_items.inventory_order_id AS order_item_inv_order_id,
    order_items.returned_at AS order_item_return,
    order_items.sale_price AS order_item_sprice
    FROM orders
    JOIN order_items
    ON orders.id = order_items.order_id;;
  }

  dimension: order_status {
    type: string
    sql:  ${TABLE}.status ;;
  }

  dimension: order_item_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
 }
