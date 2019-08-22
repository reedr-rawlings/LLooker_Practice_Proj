view: orders {
  view_label: "Orders"
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
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
    drill_fields: []
    sql: ${TABLE}.created_at ;;
  }

  dimension: diagnostics_timeline {
    type: string
    sql: CONCAT("https://diagnostics-timeline.zooxlabs.com/?run_id=", ${id}, "&ts="||extract(epoch from ${log_date_interval})) ;;
  }

  measure: created_at_time {
    type: number
    sql: CAST(${TABLE}.created_at AS time) ;;
  }

  parameter: log_date_interval {
    type: string
    allowed_value: {
      value: "Day"
    }
    allowed_value: {
      value: "Week"
    }
    allowed_value: {
      value: "Month"
    }
    allowed_value: {
      value: "Quarter"
    }
  }

  dimension: log_date_timeframe {
    type: string
    sql: CASE
      WHEN {% parameter log_date_interval %} = 'Day'  THEN ${created_date}
      WHEN {% parameter log_date_interval %} = 'Week'  THEN ${created_week}
      WHEN {% parameter log_date_interval %} = 'Month'  THEN ${created_month}
      WHEN {% parameter log_date_interval %} = 'Quarter' THEN ${created_quarter}
      END ;;
  }

  dimension: status {
    description:
    "{% if _explore._name == 'NormalName' %}
    The user ID for the Order Items Explore
    {% elsif _explore._name == 'inventory_items' %}
    The user ID for the Inventory Items Explore
    {% else %}
    The user ID
    {% endif %}"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: user_count {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
    html:
    <br>
     Value: {{value}}
    </br>
    <br>
    {% if products.brand._in_query %} {{ products.brand._value }} {% endif %}
    </br>
    ;;
  }
}
