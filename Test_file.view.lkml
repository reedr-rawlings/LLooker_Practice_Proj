 view: test_file {
   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: SELECT
         user_id as user_id
         , COUNT(*) as lifetime_orders
         , MAX(orders.created_at) as most_recent_purchase_at
       FROM orders
       GROUP BY user_id
       ;;
      persist_for: "24 Hours"
      indexes: ["user_id"]
      distribution_style: all
      distribution: "mbid"
      sortkeys: ["user_id"]
   }
}
