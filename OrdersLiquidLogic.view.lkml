view: ordersliquidlogic {
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

    parameter: does_this_filter {
      type: date
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

    dimension: cost {
      type: number
      sql: inventory_items.cost ;;
    }

    dimension: sku {
      type: string
      sql: ${TABLE}.sku ;;
    }

    dimension: gross_product {
      type: number
      sql: ${inventory_items.cost} ;;
    }

    dimension: my_counter {
      sql: 0 ;;
    }

    # Must define an associated measure and then reference that field throughout. When using any sort of math
    # It defaults to calculating it out. So the below is equal to -38
    dimension: incremental {
      sql:
      {% assign my_counter = '12-31-19' %}
      {{my_counter}}


      ;;
    }

    measure: promo_totals {
      hidden: yes
      description: "Must be used with measure_name field"
      value_format:  "[<=-1000000]($0.0,,\"M\");[<=-1000]($0.0,\"K\");$0"
      type: sum
      sql: ${retail_price} * 0.9 ;;
    }

  parameter: measure_name {
    type: unquoted
    allowed_value:
    {
      label: "Retail"
      value: "retail_price"
    }
    allowed_value: {
      label: "Gross Product"
      value: "gross_product"
    }
    allowed_value: {
      label: "Rank"
      value: "rank_alias"
    }

    allowed_value: {
      label: "Cost"
      value: "cost"
    }
    allowed_value: {
      label: "Promo Total"
      value: "promo_totals"
    }
  }

  measure: currency {
    label_from_parameter:  measure_name
    type: number
    value_format: "[>=1000000]0.0,,\"M\";[>=1000||<=-1000]0.0,\"K\";0"
    sql:  CASE
          WHEN '{% parameter measure_name %}' = 'retail_price' then ${retail_price}
          WHEN '{% parameter measure_name %}' = 'gross_product' then ${gross_product}
          WHEN '{% parameter measure_name %}' = 'rank_alias' then ${rank_alias}
          WHEN '{% parameter measure_name %}' = 'cost' then ${cost}
          else null
          end;;
  }

  #Currently does not function as expected
  measure: negative_currency
  {
    label_from_parameter:  measure_name
    type: number
    sql:
       CASE
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
          WHEN '{% parameter measure_name %}' = 'rank_alias' then ${rank_alias}
          WHEN '{% parameter measure_name %}' = 'cost' then ${cost}
          else null
          end;;
  }

  measure: Selected_Measure{
    label_from_parameter:  measure_name
    type:  number
    sql:  CASE
            WHEN '{% parameter measure_name %}' = 'retail_price' then ${retail_price}
            WHEN '{% parameter measure_name %}' = 'gross_product' then ${gross_product}
            WHEN '{% parameter measure_name %}' = 'rank_alias' then ${rank_alias}
            WHEN '{% parameter measure_name %}' = 'cost' then ${cost}
            WHEN '{% parameter measure_name %}' = 'promo_totals' then ${promo_totals}
            else null
            end;;
    html: {% if {{measure_name._parameter_value}} == "retail_price" %}
              {{currency._rendered_value}}
             {% elsif {{measure_name._parameter_value}} == "gross_product" %}
             {{ currency._rendered_value }}
               {% else %}
            {{ numbers._rendered_value }}
           {% endif %};;
          }

}
