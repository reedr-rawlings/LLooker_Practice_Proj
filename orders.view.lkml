view: orders {
  view_label: "OrdersBorders"
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

  measure: filtered_dates {
    type: count
    filters: {
      field: created_date
      value: "before this month"
    }
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

  measure: returned_count {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: []
    link: {
      label: "Explore Top 20 Results"
      url: "{{ link }}&limit=20"
    }
  }

  dimension: log_date_timeframe {
    type: string
    sql: CASE
      WHEN {% parameter log_date_interval %} = 'Day'  THEN ${created_date}
      WHEN {% parameter log_date_interval %} = 'Week'  THEN ${status}
      WHEN {% parameter log_date_interval %} = 'Month'  THEN ${created_month}
      WHEN {% parameter log_date_interval %} = 'Quarter' THEN ${created_quarter}
      END ;;
  }

  dimension: status {
    description: "{{ _view._name }}"

# "{% if _view._name == 'orders' %} ID for Users {% else %} Something else {% endif%}"
    type: string
    sql: ${TABLE}.status ;;
    html: <a style="white-space:pre;"> {{value}};;
  }

  dimension: statuseseses {
    description: "{{ _view._name }}"

# "{% if _view._name == 'orders' %} ID for Users {% else %} Something else {% endif%}"
    type: string
    sql: ${TABLE}.status ;;

  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: filtered_count {
    type: sum
    sql: ${user_id} ;;
    filters: {
      field: status
      value: "confirmed"
    }
  }

  measure: user_count {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
    html:
    <br>
      {{ products.brand._value  }} : {{rendered_value}}
    </br>
    ;;
  }
}
