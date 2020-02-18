view: derived_table {
  derived_table: {
    sql: SELECT orders.*,
    order_items.id AS order_item_id,
    order_items.inventory_item_id AS order_item_inv_order_id,
    order_items.returned_at AS order_item_return,
    order_items.sale_price AS order_item_sprice
    FROM orders
    JOIN order_items
    ON orders.id = order_items.order_id
    JOIN products
    ON products.id = order_items.inventory_item_id
    WHERE order_items.inventory_item_id > 100;;
    persist_for: "24 hours"
    indexes: ["orders.id"]
  }
#sadsadasd
  dimension: order_status {
    type: string
    sql:  ${TABLE}.status ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}.order_item_inv_order_id ;;
  }

  dimension: order_item_sale_price {
    hidden: yes
    type: number
    sql: ${TABLE}.order_item_sprice ;;
  }


  parameter: sale_price_metric_picker {
    description: "Use with the Sale Price Metric measure"
    type: unquoted
    allowed_value: {
      label: "Total Sale Price"
      value: "SUM"
    }
    allowed_value: {
      label: "Average Sale Price"
      value: "AVG"
    }
    allowed_value: {
      label: "Maximum Sale Price"
      value: "MAX"
    }
    allowed_value: {
      label: "Minimum Sale Price"
      value: "MIN"
    }
  }

  measure: sale_price_metric {
    description: "Use with the Sale Price Metric Picker filter-only field"
    type: number
    label_from_parameter: sale_price_metric_picker
    sql: {% parameter sale_price_metric_picker %}(${order_item_sale_price}) ;;
    value_format_name: usd
  }

 }
