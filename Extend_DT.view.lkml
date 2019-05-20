include: "*.view"

view: extend_dt {
extends: [derived_table]
  derived_table: {
    sql: SELECT orders.*,
          order_items.inventory_item_id AS changes_this,
          FROM orders
          JOIN order_items
          ON orders.id = order_items.order_id
          JOIN products
          ON products.id = order_items.inventory_item_id
          ;;
  }
}
