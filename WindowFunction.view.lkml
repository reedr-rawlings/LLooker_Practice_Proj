
view: windowfunction {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT
        brand,
        department,
        retail_price,
        RANK() OVER(PARTITION BY brand) AS category_profit
      FROM products
      ;;
  }

  dimension: category {
    sql: ${TABLE}.category ;;
  }

  dimension: status {
    sql: ${TABLE}.status ;;
  }

  dimension: departments {
    sql: ${TABLE}.department_alias ;;
  }

  dimension: average_retail_price {
    sql: ${TABLE}.average_retail_price ;;
  }

  dimension: profit_by_category {
    type: number
    sql: ${TABLE}.category_profit ;;
  }
}
