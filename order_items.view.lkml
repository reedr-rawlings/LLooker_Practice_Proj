view: order_items {
    sql_table_name: demo_db.order_items;;


  dimension: id_liquid {
    case: {
      when: {
        label: "b {{ _user_attributes[\"id\"] | plus:0.1  }}"
        sql: ${id} = {{ _user_attributes['id'] | plus:0.5}};;
      }
      when: {
        label: "a {{ _user_attributes[\"id\"] | minus:0.1  }}"
        sql: ${id}>={{ _user_attributes['id'] | minus:1.0 | divided_by:100.0 }} ;;
      }
    }
  }

    filter: date_filter_start {
      type: date
    }

    filter: date_filter_end {
      type: date
    }

    dimension: number_on_filter {
      type: number
      sql: {% date_start date_filter_start %} - {% date_start date_filter_end %} ;;
    }

    dimension_group: USAGE {
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
    label: "ORDER ID"
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  parameter: campaign_performance_level {
    type: unquoted
    allowed_value: {
      label: "Parent"
      value: "tth_fact_marketing_parent_campaign_performance"
    }
    allowed_value: {
      label: "Child"
      value: "fact_marketing_campaign_performance"
    }
  }

  dimension: campaign_id {
# hidden: yes # only used to join with Dim Marketing Campaign

    label:
    "{% if campaign_performance_level._parameter_value == 'tth_fact_marketing_parent_campaign_performance' %}
    Parent Campaign ID
    {% else %}
    Child Campaign ID
    {% endif %}"
    type: string
    sql: {% if campaign_performance_level._parameter_value == 'tth_fact_marketing_parent_campaign_performance' %}
      ${TABLE}.id
      {% else %}
      ${TABLE}.order_id
      {% endif %} ;;
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
    #suggestions: ["Total Sale Price", "Average Sale Price"]
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

  measure: percent_total_revenue {
    type: percent_of_total
    sql: ${total_revenue};;
    value_format_name: usd
  }

  measure: coalesce_percent {
    type: number
    sql: coalesce(${percent_total_revenue}, 0) ;;
  }

  measure: count {
    type: count
    drill_fields: [inventory_item_id, Heather]
    html:
    <a href="{{count._link}}" target="_self">
  {% if value > 10000 %}
  <span style="color:#42a338;">{{rendered_value}}</span>
  {% elsif value > 5000 %}
   <span style="color:#ffb92e;">{{rendered_value}}</span>
  {% else %}
  <span style="color:#fa4444;">{{rendered_value}}</span>
  {% endif %}
    </a>;;
  }


measure: count_sarah {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
    html:<a href={{link}}>
    {% if {{orders.count._value}} > 0 %}
    <span style=“font-weight: bold; background-color: #E0434B; font-color:#ffffff; margin: 0; border-radius: 5px; text-align:center;color: white “>{{ value }}</span>
    {% else %} <span style=“color:black; font-size:100%; text-align:center”>{{value}}</span>
    {% endif %} </a>;;
}
}
