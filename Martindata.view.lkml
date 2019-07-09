view: martindata {
  derived_table: {
    sql:
      SELECT
        1 AS id, 'user 1' AS user, 'John Smith' AS sales_rep, 'Green' AS deal_name, 'Initial Contact' AS deal_stage, 'gbp' AS currency, 5000 AS deal_value
      UNION ALL
      SELECT
        2 AS id, 'user 1' AS user, 'Sam Allison' AS sales_rep, 'Yellow' AS deal_name, 'Initial Contact' AS deal_stage, 'usd' AS currency, 2500 AS deal_value
      UNION ALL
      SELECT
        3 AS id, 'user 1' AS user, 'John Smith' AS sales_rep, 'Red' AS deal_name, 'Proposal Sent' AS deal_stage, 'usd' AS currency, 2000 AS deal_value
      UNION ALL
      SELECT
        4 AS id, 'user 1' AS user, 'John Smith' AS sales_rep, 'Blue' AS deal_name, 'Qualification' AS deal_stage, 'eur' AS currency, 1750 AS deal_value
      UNION ALL
      SELECT
        5 AS id, 'user 1' AS user, 'John Smith' AS sales_rep, 'Orange' AS deal_name, 'Proposal Sent' AS deal_stage, 'eur' AS currency, 2250 AS deal_value
      UNION ALL
      SELECT
        6 AS id, 'user 2' AS user, 'Jenny Star' AS sales_rep, 'Tree' AS deal_name, 'Call' AS deal_stage, 'jpy' AS currency, 25000 AS deal_value
      UNION ALL
      SELECT
        7 AS id, 'user 2' AS user, 'Jenny Star' AS sales_rep, 'Cloud' AS deal_name, 'Call' AS deal_stage, 'aud' AS currency, 2800 AS deal_value
      UNION ALL
      SELECT
        8 AS id, 'user 2' AS user, 'Jenny Star' AS sales_rep, 'Fish' AS deal_name, 'Email' AS deal_stage, 'aud' AS currency, 750 AS deal_value
      UNION ALL
      SELECT
        9 AS id, 'user 2' AS user, 'Sandra Lee' AS sales_rep, 'Cat' AS deal_name, 'Contract' AS deal_stage, 'rmb' AS currency, 8250 AS deal_value
      UNION ALL
      SELECT
        10 AS id, 'user 2' AS user, 'Josephine Hargrave' AS sales_rep, 'Fish' AS deal_name, 'Initial Contact' AS deal_stage, 'usd' AS currency, 2500 AS deal_value
      UNION ALL
      SELECT
        11 AS id, 'user 1' AS user, 'Chicken Dancer' AS sales_rep, 'Blue' AS deal_name, 'Qualification' AS deal_stage, 'usd' AS currency, 2000 AS deal_value


      ;;
  }

  # Unique ID
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  # Number of updates to deal?
  # dimension: activitycount {
  #   type: number
  #   sql: ${TABLE}.activitycount ;;
  #   hidden: yes
  # }

  # Date Created
  # dimension_group: cdate {
  #   label: "Created"
  #   group_label: "Created"
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.cdate ;;
  # }

  # Currency used
  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  # Pipeline ID
  # dimension: d_groupid {
  #   type: number
  #   value_format_name: id
  #   hidden: yes
  #   sql: ${TABLE}.d_groupid ;;
  # }

  # Stage ID
  # dimension: d_stageid {
  #   type: number
  #   value_format_name: id
  #   hidden: yes
  #   sql: ${TABLE}.d_stageid ;;
  # }

  # Most recent date modified
  # dimension_group: mdate {
  #   group_label: "Modified"
  #   label: "Modified"
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.mdate ;;
  # }

  # ??
  dimension: customer_acct_id {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.customer_acct_id ;;
  }

  # ??
  dimension: percent {
    type: number
    hidden: yes
    sql: ${TABLE}.percent ;;
  }

  # ??
  # dimension: prediction_score {
  #   type: number
  #   sql: ${TABLE}.prediction_score ;;
  # }

  # Status of deal
  # dimension: status {
  #   type: string
  #   case: {
  #     when: {
  #       sql: ${TABLE}.status = 0 ;;
  #       label: "open"
  #     }
  #     when: {
  #       sql: ${TABLE}.status = 1 ;;
  #       label: "won"
  #     }
  #     when: {
  #       sql: ${TABLE}.status = 2 ;;
  #       label: "lost"
  #     }
  #   }
  # }

  # Status of deal (int)
  # dimension: status_num {
  #   type: number
  #   sql: ${TABLE}.status ;;
  # }

  # Contact ID
  # dimension: subscriberid {
  #   type: number
  #   value_format_name: id
  #   hidden: yes
  #   sql: ${TABLE}.subscriberid ;;
  # }

  # Title
  # dimension: title {
  #   type: string
  #   sql: ${TABLE}.title ;;
  # }

  # User ID
  # dimension: userid {
  #   type: number
  #   value_format_name: id
  #   hidden: yes
  #   sql: ${TABLE}.userid ;;
  # }

  # Value
  dimension: value {
    type: number
    value_format: "0.00"
    sql: ${TABLE}.deal_value/100 ;;
  }

  dimension: value_rank2 {
    type: tier
    tiers: [100000, 200000, 300000, 400000, 500000, 600000]
    style: integer
    sql: ${value} ;;
    value_format_name: usd_0
  }

  # Value bucket
  dimension: value_rank {
    case: {
      when: {
        sql: ${value} <= 1000 ;;
        label: "< 1,000"
      }
      when: {
        sql: ${value} > 1000 AND ${value} <= 2500 ;;
        label: "1,001 - 2,500"
      }
      when: {
        sql: ${value} > 2500 AND ${value} <= 5000 ;;
        label: "2,501 - 5,000"
      }
      when: {
        sql: ${value} > 5000 AND ${value} <= 15000 ;;
        label: "5,001 - 15,000"
      }
      when: {
        sql: ${value} > 15000 AND ${value} <= 50000 ;;
        label: "15,001 - 50,000"
      }
      when: {
        sql: ${value} > 50000 AND ${value} <= 100000 ;;
        label: "50,001 - 100,000"
      }
      when: {
        sql: ${value} > 100000 ;;
        label: "> 100,000"
      }
    }
  }

  # Total number of deals.
  measure: count {
    type: count
  }

  # Total value of deals
  # Label added to address Looker dashboard presentation
  measure: total_value {
    label: "Value"
    type: sum
    value_format: "$#,##0"
    sql: ifnull(${value}, 0) ;;
  }

  # Share of total number deals
  measure: percent_total {
    type: percent_of_total
    sql: ${count} ;;
  }

  # Share of total value of deals
  measure: percent_total_value {
    type: percent_of_total
    sql: ${total_value} ;;
  }

  # Average value of deals
  measure: average_value {
    type: number
    value_format: "$#,##0"
    sql: IFNULL(${total_value} / ${count}, 0) ;;
  }

  # Total number of won deals
  # measure: count_won {
  #   type: count
  #   filters: {
  #     field: status_num
  #     value: "1"
  #   }
  #   value_format_name: decimal_0
  # }

  # Total number of lost deals
  # measure: count_lost {
  #   type: count
  #   filters: {
  #     field: status_num
  #     value: "2"
  #   }
  #   value_format_name: decimal_0
  # }

  # Total value of won deals
  # measure: total_value_won {
  #   type: sum
  #   sql: ${value} ;;
  #   filters: {
  #     field: status_num
  #     value: "1"
  #   }
  #   value_format_name: usd_0
  # }

  # measure: total_value_won_f {
  #   type: number
  #   sql: ${total_value_won} ;;
  #   html: {{ currency_symbol_f._linked_value}} {{rendered_value}} {{ currency_symbol_b._linked_value}} ;;
  # }

  # # Total value of lost deals
  # measure: total_value_lost {
  #   type: sum
  #   sql: ${value} ;;
  #   filters: {
  #     field: status_num
  #     value: "2"
  #   }
  #   value_format_name: usd_0
  # }

  # # Average value of won deals
  measure: avg_value_won {
    type: average
    sql: ${value} ;;
    value_format_name: usd_0
  }

  measure: avg_value_won_f {
    type: number
    sql: ${avg_value_won} ;;
    html: {{ currency_symbol_f._linked_value}} {{rendered_value}} {{ currency_symbol_b._linked_value}} ;;
  }

  # Number of won deals/number of won and lost deals
  # measure: won_ratio_count {
  #   type: number
  #   sql: ifnull(${count_won} / (${count_won} +  ${count_lost}),0)  ;;
  #   value_format_name: percent_2
  # }

  # # Value of won deals/value of  won and lost deals
  # measure: won_ratio_value {
  #   type: number
  #   sql: ifnull(${total_value_won} / (${total_value_won} + ${total_value_lost}),0) ;;
  #   value_format_name: percent_2
  # }

  # # Individual share of number of all won deals
  # measure: share_won {
  #   type: percent_of_total
  #   sql: ${count_won} ;;
  #   value_format: "0.00\%"
  # }

  # # Individual share of value of all won deals
  # measure: share_value_won {
  #   type: percent_of_total
  #   sql: ${total_value_won} ;;
  #   value_format: "0.00\%"
  # }

  # currency formatting for symbols rendered before amount
  dimension: currency_symbol_f {
    type:  string
    sql:
      case
        when ${currency} = 'usd' then '$'
        when ${currency} = 'aud' then '$'
        when ${currency} = 'cad' then '$'
        when ${currency} = 'kwd' then 'KD'
        when ${currency} = 'gbp' then '£'
        when ${currency} = 'czk' then 'Kč'
        when ${currency} = 'cny' then '¥'
        when ${currency} = 'jpy' then '¥'
        when ${currency} = 'nzd' then '$'
        when ${currency} = 'brl' then 'R$'
        when ${currency} = 'zar' then 'R'
        when ${currency} = 'idr' then 'Rp'
        when ${currency} = 'clp' then '$'
        when ${currency} = 'sgd' then 'S$'
        when ${currency} = 'inr' then '&#8377'
        when ${currency} = 'myr' then 'RM'
        when ${currency} = 'mxn' then 'Mex$'
        when ${currency} = 'thb' then '฿'
        when ${currency} = 'hkd' then '$'
        when ${currency} = 'aed' then 'AED'
        when ${currency} = 'chf' then 'CHF'
        when ${currency} = 'cop' then '$'
        else ' '
      end ;;
    html: {% if value == "&#8377" %} ₹ {% else %} {{ value }} {% endif %};;
  }

  # currency formatting for symbols rendered after amount
  dimension: currency_symbol_b {
    type:  string
    sql:
      case
        when ${currency} = 'eur' then '€'
        when ${currency} = 'dkk' then 'kr'
        when ${currency} = 'sek' then 'kr'
        when ${currency} = 'nok' then 'kr'
        when ${currency} = 'rub' then '₽'
        when ${currency} = 'czk' then 'Kč'
        when ${currency} = 'huf' then 'Ft'
        when ${currency} = 'pln' then 'zł'
        else ' '
      end ;;
  }

  # multi-currency formatting
  measure: total_value_f2 {
    type: sum
    value_format_name: decimal_0
    sql: ${value} ;;
    html: {{ currency_symbol_f._linked_value}} {{rendered_value}} {{ currency_symbol_b._linked_value}};;
  }

  # unformatted total value
  measure: total_value_no_f {
    type: sum
    value_format_name: decimal_0
    sql: ${value} ;;
    html: {{rendered_value}} ;;
  }

  # unformatted average value
  measure: average_value_no_f {
    type: number
    value_format: "#,##0"
    sql: IFNULL(${total_value} / ${count}, 0) ;;
    html: {{rendered_value}} ;;
  }

  # Average value of deals formatted
  measure: average_value_f2 {
    type: number
    value_format: "#,##0"
    sql: IFNULL(${total_value} / ${count}, 0) ;;
    html: {{ currency_symbol_f._linked_value}} {{rendered_value}} {{ currency_symbol_b._linked_value}};;
  }

}
