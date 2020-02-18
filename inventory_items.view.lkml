view: inventory_items {
  sql_table_name: demo_db.inventory_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  filter: date_lf {
    type: date
  }

  dimension: date_start_liquid {
    type: yesno
    sql: ${created_date} <= {% date_start date_lf %} ;;
  }

  dimension: date_end_liquid {
    type: yesno
    sql: ${created_date} <= {% date_end date_lf %} ;;
  }

  measure: count_start {
    type: count
    filters: {
      field: date_start_liquid
      value: "yes"
    }
  }

  measure: count_end {
    type: count
    filters: {
      field: date_end_liquid
      value: "yes"
    }
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: product_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: sold {
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
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, products.item_name, products.id, order_items.count]
  }

  measure: string_case {
    type: string
    sql: CASE
    WHEN ${count} < 100 THEN "Renew"
    WHEN ${count} > 100 THEN "Don't Renew"
    ELSE  "Else"
    END
    ;;
  }
}
