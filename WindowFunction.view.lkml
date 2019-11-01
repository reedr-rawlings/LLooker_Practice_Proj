
view: windowfunction {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT
        category
        , department_alias
        , average_retail_price
        , SUM(average_retail_price) OVER(PARTITION BY category) AS category_profit
      FROM products
      ORDER BY category, department_alias, average_retail_price
      ;;
  }

  dimension: category {
    sql: ${TABLE}.category ;;
  }

  dimension: departments {
    sql: ${TABLE}.department_alias ;;
  }

  dimension: average_retail_price {
    sql: ${TABLE}.average_retail_price ;;
  }

  dimension: profit_by_category {
    sql: ${TABLE}.category_profit ;;
  }
}
