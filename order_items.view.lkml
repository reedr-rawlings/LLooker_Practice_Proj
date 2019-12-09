view: order_items {
    sql_table_name: {% if _user_attributes['unlimited_spectrum'] == "yes" %}
      demo_db.order_items
    {% elsif order_id._is_filtered and usage_date._is_filtered == "true" %}
          demo_db.order_items
      {% else %}
          must_filter_on_org_and_date
    {% endif %} ;;

   #sql_table_name: demo_db.order_items ;;

  # dimension: limited_spectrum {
  #   type: yesno
  #   sql:  {%if ((usage_date._is_filtered or usage_week._is_filtered)
  #     and (order_id._is_filtered or inventory_item_id._is_filtered)) %}
  #   {% endif %};;
  # }

    dimension_group: usage {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      time_of_day,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.returned_at ;;
  }

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
    html: <font color="#42a338 ", size="4">{{ value }}</font> ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: Heather  {
    type:  string
    sql:  "Heather" ;;
  }

  measure: count_label {
    label: "{% if _explore._name == 'order_items' %} From Order_Items {% else %} Not from Order_Items {% endif %}"
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }

  parameter: sale_price_metric_picker {
    description: "Use with the Sale Price Metric measure"
    type: unquoted
    suggestions: ["Total Sale Price", "Average Sale Price"]
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
    drill_fields: [order_id,total_revenue]
  }

  filter: category_count_picker {
    description: "Use with the Category Count measure"
    type: string
    suggest_explore: order_items_warehouse
    suggest_dimension: products.category
  }

  filter: date_picker {
    type: date
  }

#

  measure: sum {
    description: "Sum of the sale price"
    label: "Sumsum"
    sql: ${sale_price} ;;
    type: sum

  }

  measure: subquery_sum {
    description: "Trying to subquery in a sql"
    sql: SELECT max(${sale_price} from (select AVG(${inventory_item_id}) FROM demo_db.order_items) ;;
  }


  measure: total_revenue {
    type: sum
    sql: ${sale_price};;
    value_format_name: usd
  }


}
