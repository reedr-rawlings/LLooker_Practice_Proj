    view: map_layer_GCP {
      derived_table: {
        sql:
              SELECT
                'E02000001' AS test_total_item_msoa_ons_postcode_lookup_msoa,'Barking and Dagenham 002' AS msoa11nm, 429 AS test_total_item_msoa_prescriptions_total_items
              UNION ALL
              SELECT
                'E02000002' AS test_total_item_msoa_ons_postcode_lookup_msoa, 'Barking and Dagenham 001' AS msoa11nm, 001391 AS test_total_item_msoa_prescriptions_total_items
              UNION ALL
              SELECT
                'E02000003' AS test_total_item_msoa_ons_postcode_lookup_msoa, 'Barking and Dagenham 002' AS msoa11nm,'1,029' AS test_total_item_msoa_prescriptions_total_items
              UNION ALL
              SELECT
                'E02000004' AS test_total_item_msoa_ons_postcode_lookup_msoa,'Barking and Dagenham 002' AS msoa11nm, 936 AS test_total_item_msoa_prescriptions_total_items
              UNION ALL
              SELECT
                'E02000005' AS test_total_item_msoa_ons_postcode_lookup_msoa,'Barking and Dagenham 002' AS msoa11nm, 677 AS test_total_item_msoa_prescriptions_total_items
              UNION ALL
              SELECT
                'E02000007' AS test_total_item_msoa_ons_postcode_lookup_msoa, 'Barking and Dagenham 002' AS msoa11nm,868 AS test_total_item_msoa_prescriptions_total_items
              UNION ALL
              SELECT
                'E02000008' AS test_total_item_msoa_ons_postcode_lookup_msoa, 'Barking and Dagenham 002' AS msoa11nm,'2,869' AS test_total_item_msoa_prescriptions_total_items
              UNION ALL
              SELECT
                'E02000009' AS test_total_item_msoa_ons_postcode_lookup_msoa, 'Barking and Dagenham 002' AS msoa11nm,653 AS test_total_item_msoa_prescriptions_total_items
              UNION ALL
              SELECT
                'E02000010' AS test_total_item_msoa_ons_postcode_lookup_msoa, 'Barking and Dagenham 002' AS msoa11nm,702 AS test_total_item_msoa_prescriptions_total_items
              UNION ALL
              SELECT
                'E02000011' AS test_total_item_msoa_ons_postcode_lookup_msoa, 'Barking and Dagenham 002' AS msoa11nm,'1,112' AS test_total_item_msoa_prescriptions_total_items

              ;;
      }

      dimension: test_total_item_msoa_ons_postcode_lookup_msoa {
        map_layer_name: Middle_Layer_Supe
        type: string
        sql: ${TABLE}.test_total_item_msoa_ons_postcode_lookup_msoa ;;
      }

      dimension: msoa11nm {
        map_layer_name: Middle_Layer_Supe
        type: string
        sql: ${TABLE}.msoa11nm ;;
      }

      dimension: test_total_item_msoa_prescriptions_total_items {
        type: number
        sql: ${TABLE}.test_total_item_msoa_prescriptions_total_items ;;
      }

      measure: count {
        type: count
      }
      measure: sum_msoa {
        type: sum
        sql: ${test_total_item_msoa_prescriptions_total_items};;
      }
    }
