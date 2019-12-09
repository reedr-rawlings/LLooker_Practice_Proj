view: derived_base {

  derived_table: {
    sql: SELECT 'this is the sql from the base table' as "example_text";;
    persist_for: "1 hour"
  }
  dimension: example_text {}

}
