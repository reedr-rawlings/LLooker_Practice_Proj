view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    html:  <a href="https://www.google.com/search?q={{value}}">{{ value }}</a> ;;
  }

  filter: brand_select {
    suggest_dimension: brand
    type: string
  }

  dimension: brand_comparitor {
    sql:
     CASE
     WHEN {% condition brand_select %} ${products.brand} {% endcondition %}
     THEN ${products.brand}
     ELSE "All Other Brands"
     END ;;
  }

  dimension: yesnobrand {
    type: yesno
    sql: ${TABLE}.brand = "PUMA" ;;
  }

  parameter: does_this_filter {
    type: date
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    drill_fields: [department_alias, retail_price, orders.statuseseses]
  }

   set: charles_barks {fields: [orders.statuseseses]}

  dimension: department_alias {
   # label: "Balloon"
    alias: [department]
    type: string
    sql: ${TABLE}.department ;;
  }

  measure: count_not_men {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
    filters: {
      field: department_alias
      value: "Men"
    }
    }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank_alias {
    label: "NamingNames"
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
    label: "Drill Count"
    type: count
    drill_fields: [details*]
  #   link: {
  #     label: "Show as bar plot"
  #     url: "
  #     {% assign vis_config = '{\"type\": \"looker_bar\"}' %}
  #     {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
  # }
 }

  set: details {
    fields: [id, item_name, inventory_items.count]
    }

  measure: average_retail_price {
    type: average
    sql: ${retail_price} ;;
  }


  measure: count_not_puma {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
    filters: {
      field: brand
      value: "puma"
    }
    link: {
      label: "Show as bar plot"
      url: "
      {% assign vis_config = '{\"type\": \"looker_bar\"}' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    }
  }

  measure: count_no_active {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
    filters: {
      field: category
      value: "Active"
    }
  }

  measure: no_active_gross {
    type:  number
    sql: (${count} - ${count_no_active})/4 ;;

 }

  set: filtered_measures_using_joins {
    fields: [
      count_no_active,
      brand
    ]
  }

}
