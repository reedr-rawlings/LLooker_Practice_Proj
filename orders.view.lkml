view: orders {
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
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
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
