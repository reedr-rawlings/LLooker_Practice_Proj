connection: "thelook"

# include all the views
include: "*.view"
include: "*.dashboard"

datagroup: new_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: new_project_default_datagroup

explore: test_count_query {}

explore: orders_items_filtered {
  label: "Filtered Labels"
   from: order_items
  always_filter: {
    filters: {
      field: sale_price
      value: ">=100"
    }
  }
  join: orders {
    view_label: "Charmander"
    type: left_outer
    sql_on: ${orders_items_filtered.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }
}

explore: windowfunction {}

explore: events {
#   always_filter: {
#     filters: {
#       field: users.table_name
#       value: "users"
#     }
#   }
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
   }
}




explore: ordersliquidlogic {
  join: inventory_items {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${ordersliquidlogic.id} ;;
    relationship: many_to_one
  }
}

explore: extend_inventory_items {
  view_label: "Where is this"
  extends: [inventory_items]
}

explore: inventory_items {
  view_name: inventory_items
  # Should be throwing an error
  fields: [ALL_FIELDS*]#, -products.category]
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: order_items {
    type: left_outer
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
    relationship: one_to_many
  }
}

explore: order_items_price_filter {
  from: order_items
  sql_always_where: ${sale_price} >= 100.00 ;;
}

explore: order_items {

  join: inventory_items {

    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {

    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}



explore: orders {
  join: users {
    fields: [users.age]
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: products {
  join: inventory_items {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: one_to_one
  }

  join: order_items {
    type: left_outer
    sql_on: ${products.id} = ${order_items.inventory_item_id};;
    relationship: many_to_one
  }

    join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: schema_migrations {}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: derived_table {}

explore: users {
#   always_filter: {
#     filters: {
#       field: users.table_name
#       value: "users"
#     }
#   }
}

explore: users_nn {}

map_layer: raphael_map {
  file: "map_raphael.topojson"
  property_key: "name"
}

map_layer: Middle_Layer_Supe {
  file: "ML_uk.topojson"
}
