view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: count {
    label: "{% if _explore._name == 'order_items' %} From Order_Items {% else %} Not from Order_Items {% endif %}"
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }

#  measure: notes {
#    type:  number
 #   sql:  case when "${TABLE}" = "products" then max(${count})
#               when "{{ _view._name }}" = "orders_items" then max(${count})
#              else sum(${count}) end;;
#/   }

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
    sql: {% parameter sale_price_metric_picker %}(${sale_price}) ;;
    value_format_name: usd
  }

  filter: category_count_picker {
    description: "Use with the Category Count measure"
    type: string
    suggest_explore: order_items_warehouse
    suggest_dimension: products.category
  }

  measure: category_count {
    description: "Use with the Category Count Picker filter-only field"
    type: sum
    sql:
    CASE
      WHEN {% condition category_count_picker %} ${products.category} {% endcondition %}
      THEN 1
      ELSE 0
    END
  ;;
  }

  measure: sum {
    description: "Sum of the sale price"
    label: "Sumsum"
    sql: ${sale_price} ;;
    type: sum

  }

  measure: total_revenue {
    type: sum
    sql: ${sale_price};;
    value_format_name: usd
  }

  measure: total_profit {
    hidden: yes
    type: number
    sql: ${total_revenue}-${inventory_items.cost} ;;
    value_format_name: usd
  }

}
