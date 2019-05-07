view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    description: "how many lines can I right? Can I write tis on a new line like this,
    cause or do I need to do some sort of escape mechanism?

    Should be a niew line: How does this looke"
    type: string
    sql: ${TABLE}.brand ;;
    html:  <a href="https://www.google.com/search?q={{value}}">{{ value }}</a> ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank_alias {
    alias: [ rank ]
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: gross_product {
    type: number
    sql: ${retail_price} – ${inventory_items.cost} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]

  }

  measure: count_not_puma {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
    filters: {
      field: brand
      value: "puma"
    }
  }

  measure: count_no_active {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
    filters: {
      field:category
      value: "Active"
    }
  }

  measure: no_active_gross {
    type:  number
    sql: (${count} - ${count_no_active})/4 ;;

 }


}
