view: Session_Order_Summary {
  sql_table_name: looker.fact_session_order_summary ;;
  label: "WBR Summary"

#---------------------------------------------------------------------------DIMENSIONS--------------------------------------------------------------------------------------------------#


  dimension: affiliateid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.affiliateid ;;
  }
  dimension: buyer_fees {
    type: number
    hidden: yes
    sql: ${TABLE}.buyer_fees ;;
  }
  dimension: buyer_taxes {
    type: number
    hidden: yes
    sql: ${TABLE}.buyer_taxes ;;
  }

  dimension: coupon_dollar_value {
    type: number
    hidden: yes
    sql: ${TABLE}.coupon_dollar_value ;;
  }
  dimension: customer_email {
    type: string
    hidden: yes
    sql: ${TABLE}.customerEmail ;;
  }
  dimension: derived_pk {
    type: string
    hidden: yes
    sql: ${TABLE}.DerivedPK ;;
  }
  dimension: device_category_id {
    type: number
    hidden: yes
    sql: ${TABLE}.deviceCategoryId ;;
  }
  dimension: eticket_fee {
    type: number
    hidden: yes
    sql: ${TABLE}.eticket_fee ;;
  }
  dimension: tickets {
    type: number
    hidden: yes
    sql: ${TABLE}.tickets ;;
  }
  dimension: existing_customer {
    type: number
    hidden: yes
    sql: ${TABLE}.existing_customer ;;
  }
  dimension: fedex_fee {
    type: number
    hidden: yes
    sql: ${TABLE}.fedex_fee ;;
  }
  dimension: gov {
    hidden: yes
    type: number
    sql: ${TABLE}.GOV ;;
  }
  dimension: hash_value_one {
    hidden: yes
    type: number
    sql: ${TABLE}.hashValueOne ;;
  }
  dimension: hash_value_two {
    hidden: yes
    type: number
    sql: ${TABLE}.hashValueTwo ;;
  }
  dimension: markupdown {
    hidden: yes
    type: number
    sql: ${TABLE}.markupdown ;;
  }
  dimension: new_customer {
    type: number
    hidden: yes
    sql: ${TABLE}.new_customer ;;
  }
  dimension: new_order {
    type: number
    hidden: yes
    sql: ${TABLE}.new_order ;;
  }
  dimension: order_count {
    hidden: yes
    type: number
    sql: ${TABLE}.orderCount ;;
  }
  dimension: promo_orders {
    type: number
    hidden: yes
    sql: ${TABLE}.promo_orders ;;
  }
  dimension: returning_order {
    type: number
    hidden: yes
    sql: ${TABLE}.returning_order ;;
  }
  dimension: seller_fee {
    type: number
    hidden: yes
    sql: ${TABLE}.seller_fee ;;
  }
  dimension: session_count {
    hidden: yes
    type: number
    sql: ${TABLE}.sessionCount ;;
  }
  dimension: list_price {
    label: "List Price"
    hidden: yes
    type: number
    sql: ${TABLE}.list_price ;;
  }
  dimension: traffic_source_id {
    type: number
    hidden: yes
    sql: ${TABLE}.trafficSourceId ;;
  }
  dimension: payable_to_seller {
    type: number
    hidden: yes
    sql: ${TABLE}.payable_to_seller ;;
  }
  dimension: eventid {
    type: number
    hidden: yes
    sql: ${TABLE}.eventid ;;
  }

  #---------------------------------------------------------------------------MEASURES--------------------------------------------------------------------------------------------------#

  measure: Sessions {
    group_label: "Ecommerce"
    type: number
    value_format_name: decimal_0
    #value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    sql: (sum(distinct cast(${TABLE}.sessionCount as bigint) +  ${TABLE}.hashvalueone)  - sum(distinct ${TABLE}.hashvaluetwo)) ;;
  }
  measure: Orders {
    type: number
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    sql: sum(${TABLE}.orderCount) ;;
  }
  measure: conv_numerator {
    type: number
    hidden: yes
    sql:sum(iif(${Partners.PartnerGAViewId} is null,null,${TABLE}.orderCount)) ;;
  }
  measure: Conv_Rate{
    group_label: "Ecommerce"
    label: "Conv. Rate"
    type: number
    value_format_name: percent_1
    sql:  ${conv_numerator} / nullif(${Sessions}, 0) ;;
  }
  measure: ticket_cost {
    label: "Ticket Cost"
    type: number
    value_format: "[>=1000000]$0.0,,\"M\";[>=1000]$0.0,\"K\";$0"
    sql: sum(${payable_to_seller}) ;;
  }
  measure: GOV {
    label: "GOV"
    type: number
    value_format: "[>=1000000]$0.0,,\"M\";[>=1000]$0.0,\"K\";$0"
    sql: sum(${gov})  ;;
  }
  measure: List_price {
    label: "List Price"
    type: number
    value_format: "[>=1000000]$0.0,,\"M\";[>=1000]$0.0,\"K\";$0"
    sql: sum(${list_price})  ;;
  }
  measure: avg_order_size {
    label: "AOS"
    type: number
    value_format: "[>=1000000]$0.0,,\"M\";[>=1000]$0.0,\"K\";$0"
    sql: ${GOV} / ${Orders} ;;
  }
  measure: new_customers {
    group_label: "Customers"
    label: "New Customers"
    type: number
    value_format_name: decimal_0
    sql: count(distinct case when ${TABLE}.new_customer > 0 then ${TABLE}.customeremail END) ;;
  }
  measure: existing_customers {
    group_label: "Customers"
    label: "Returing Customers"
    type: number
    value_format_name: decimal_0
    sql: count(distinct case when ${TABLE}.existing_customer > 0 and ${TABLE}.new_customer < 1 then ${TABLE}.customeremail END) ;;
  }
  measure: new_customer_orders{
    group_label: "Customers"
    label: "New Customer Orders"
    type: number
    value_format_name: decimal_0
    sql: sum(case when ${TABLE}.new_customer > 0 then ${TABLE}.OrderCount end) ;;
  }
  measure: existing_customer_orders{
    group_label: "Customers"
    label: "Existing Customer Orders"
    type: number
    value_format_name: decimal_0
    sql: sum(case when ${TABLE}.existing_customer > 0 and ${TABLE}.new_customer < 1 then ${TABLE}.OrderCount end)  ;;
  }
  measure: new_cust_order_percent {
    group_label: "Customers"
    label: "New Customer Order %"
    type: number
    value_format_name: percent_1
    sql: cast(${new_customer_orders} as numeric(18,2)) / cast(${Orders} as numeric(18,2)) ;;
  }
  measure: promo_count {
    group_label: "Promo"
    label: "Promo Count"
    type: number
    value_format_name: decimal_0
    sql: sum(${TABLE}.promo_orders);;
  }
  measure: promo_totals {
    group_label: "Promo"
    label: "Promo Total"
    type: number
    value_format:   "[<=-1000000]($0.0,,\"M\");[<=-1000]($0.0,\"K\");($0)"
    sql: sum(${TABLE}.coupon_dollar_value);;
  }
  measure: take_rate {
    group_label: "Rates"
    label: "Take Rate"
    type: number
    value_format_name: percent_1
    sql: (${GOV} - ${ticket_cost}) / ${GOV} ;;
  }
  measure: broker_revenue {
    group_label: "Revenues"
    label: "Broker Revenue"
    type: number
    value_format: "[>=1000000]$0.0,,\"M\";[>=1000]$0.0,\"K\";$0"
    sql: sum(${TABLE}.seller_fee) ;;
  }
  measure: ticket_count {
    label: "Tickets"
    type: number
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    sql: sum(${TABLE}.tickets) ;;
  }
  measure: buy_fee {
    group_label: "Revenues"
    label: "Buy Fee"
    type: number
    value_format: "[>=1000000]$0.0,,\"M\";[>=1000]$0.0,\"K\";$0"
    sql: sum(${TABLE}.buyer_fees);;
  }
  measure: sell_fee {
    hidden: yes
    group_label: "Revenues"
    label: "Sell Fee"
    type: number
    value_format: "[>=1000000]$0.0,,\"M\";[>=1000]$0.0,\"K\";$0"
    sql: sum(${TABLE}.seller_fee);;
  }
  measure: eTicket_fee {
    group_label: "Revenues"
    label: "eTicket Fees"
    type: number
    value_format: "[>=1000000]$0.0,,\"M\";[>=1000]$0.0,\"K\";$0"
    sql: sum(${TABLE}.eticket_fee);;
  }
  measure: fedEx_fee {
    group_label: "Revenues"
    label: "FedEx Fee"
    type: number
    value_format: "[>=1000000]$0.0,,\"M\";[>=1000]$0.0,\"K\";$0"
    sql: sum(${TABLE}.fedex_fee);;
  }
  parameter: measure_name {
    type: unquoted
    allowed_value:
    {
      label: "GOV"
      value: "gov"
    }
    allowed_value: {
      label: "eTicket Fees"
      value: "eTicket_fee"
    }
    allowed_value: {
      label: "FedEx Fees"
      value: "fedEx_fee"
    }
    allowed_value: {
      label: "Buyer Fees"
      value: "buy_fee"
    }
    allowed_value: {
      label: "Promo Totals"
      value: "promo_totals"
    }
    allowed_value: {
      label: "Broker Revenues"
      value: "broker_revenue"
    }
    allowed_value: {
      label: "Orders"
      value: "orders"
    }
  }
  measure: currency
  {
    label_from_parameter:  measure_name
    type: number
    value_format: "[>=1000000]0.0,,\"M\";[>=1000||<=-1000]0.0,\"K\";0"
    sql:  CASE
      WHEN '{% parameter measure_name %}' = 'gov' then ${GOV}
      WHEN '{% parameter measure_name %}' = 'eTicket_fee' then ${eTicket_fee}
      WHEN '{% parameter measure_name %}' = 'fedEx_fee' then ${fedEx_fee}
      else null
      end;;
  }
  measure: negative_currency
  {
    label_from_parameter:  measure_name
    type: number
    value_format:  "[<=-1000000]($0.0,,\"M\");[<=-1000]($0.0,\"K\");($0)"
    sql:  CASE
      WHEN '{% parameter measure_name %}' = 'promo_totals' then ${promo_totals}
      else null
      end;;
  }


  measure: numbers
  {
    label_from_parameter:  measure_name
    type: number
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    sql:  CASE
            WHEN '{% parameter measure_name %}' = 'orders' then ${Orders}
            else null
            end;;
  }

  measure: Selected_Measure{
    label_from_parameter:  measure_name
    type:  number
    sql:  CASE
              WHEN '{% parameter measure_name %}' = 'gov' then ${GOV}
              WHEN '{% parameter measure_name %}' = 'orders' then ${Orders}
              WHEN '{% parameter measure_name %}' = 'eTicket_fee' then ${eTicket_fee}

              else null
              end;;
html: {% if _filters['measure_name'] == "gov" $}
             {{ currency._rendered_value }}
            {% elsif _filters['measure_name'] == "eTicket_fee" %}
             {{ currency._rendered_value }}
              {% else %}
            {{ numbers._rendered_value }}
          {% endif %};;
    }
  }
#or _filters['measure_name'] == "eTicket_fee"
