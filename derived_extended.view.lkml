
include: "derived_view.view"
view: derived_extended {
  extends: [derived_base]
  derived_table: {
    # the below SQL will overwrite whatever SQL was in the base view
    sql: SELECT ‘this is the sql in the EXTENDED view’ as “example_text” ;;
    persist_for: "2 hours"

  }

  # note that I don’t have to redefine the example_text dimension since that was already in the base view.
}
