- dashboard: all_visualization_styles
  title: All Visualization Styles
  layout: newspaper
  elements:
  - title: Change Name
    name: Change Name
    model: NormalName
    explore: order_items
    type: single_value
    fields: [order_items.sale_price_metric, products.brand, orders.count]
    filters:
      order_items.sale_price_metric_picker: SUM
      products.brand: "-PUMA"
    sorts: [order_items.sale_price_metric desc]
    limit: 10
    column_limit: 50
    dynamic_fields: [{table_calculation: mean_price, label: Mean Price, expression: 'mean(${order_items.sale_price_metric})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: distance_from_mean, label: Distance From Mean, expression: "${order_items.sale_price_metric}\
          \ - ${mean_price}", value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.sale_price_metric,
            id: order_items.sale_price_metric, name: Total Sale Price}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: distance_from_mean,
            id: distance_from_mean, name: Distance From Mean}], showLabels: true,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: order_items.sale_price_metric
    plot_size_by_field: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle_outline
    series_colors:
      order_items.sale_price_metric: "#10C871"
      distance_from_mean: "#f2f9fc"
    series_labels:
      mean_price: Mean Line - $31, 829
    series_point_styles:
      mean_price: triangle-down
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [order_items.category_count, mean_price]
    listen: {}
    row: 17
    col: 8
    width: 8
    height: 6
  - title: Timeline
    name: Timeline
    model: NormalName
    explore: order_items
    type: looker_timeline
    fields: [products.category, inventory_items.created_month, orders.created_month,
      order_items.sale_price_metric, orders.count]
    filters:
      order_items.sale_price_metric_picker: SUM
      products.brand: PUMA,"'47 Brand",525 America,7 For All Mankind,Allegra K,10
        Deep,180s
      order_items.returned_month: NOT NULL
    sorts: [mean_price desc]
    column_limit: 50
    dynamic_fields: [{table_calculation: mean_price, label: Mean Price, expression: 'mean(${order_items.sale_price_metric})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: distance_from_mean, label: Distance From Mean, expression: "${order_items.sale_price_metric}\
          \ - ${mean_price}", value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.sale_price_metric,
            id: order_items.sale_price_metric, name: Total Sale Price}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: distance_from_mean,
            id: distance_from_mean, name: Distance From Mean}], showLabels: true,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: order_items.sale_price_metric
    plot_size_by_field: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle_outline
    series_colors:
      order_items.sale_price_metric: "#10C871"
      distance_from_mean: "#f2f9fc"
    series_labels:
      mean_price: Mean Line - $31, 829
    series_point_styles:
      mean_price: triangle-down
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [order_items.category_count, mean_price, distance_from_mean]
    row: 17
    col: 16
    width: 8
    height: 6
  - name: BoxJank
    title: BoxJank
    model: NormalName
    explore: order_items
    type: looker_column
    fields: [products.brand, order_items.sale_price_metric, orders.count]
    filters:
      order_items.sale_price_metric_picker: SUM
      products.brand: Zumba Fitness
      orders.created_year: 1 years
    sorts: [products.brand desc]
    limit: 10
    column_limit: 50
    dynamic_fields: [{table_calculation: mean_price, label: Mean Price, expression: 'mean(${order_items.sale_price_metric})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: distance_from_mean, label: Distance From Mean, expression: "${order_items.sale_price_metric}\
          \ - ${mean_price}", value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: Seriously Jank, orientation: left, series: [{axisId: order_items.sale_price_metric,
            id: order_items.sale_price_metric, name: Single Value Viz for Pros}],
        showLabels: false, showValues: false, maxValue: !!null '', minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 53, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: order_items.sale_price_metric
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '9'
    hide_legend: true
    legend_position: left
    font_size: '128'
    series_types: {}
    point_style: none
    series_colors:
      order_items.sale_price_metric: "#ffffff"
      distance_from_mean: "#f2f9fc"
    series_labels:
      mean_price: Mean Line - $31, 829
      order_items.sale_price_metric: Single Value Viz for Pros
    series_point_styles:
      mean_price: triangle-down
    show_value_labels: true
    label_density: 25
    label_color: [blue]
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    swap_axes: false
    show_null_points: false
    hidden_fields: [order_items.category_count, mean_price, products.brand, orders.count,
      distance_from_mean]
    row: 7
    col: 0
    width: 8
    height: 6
  - title: "Cheddar"
    name: "Cheddar"
    model: NormalName
    explore: order_items
    type: looker_scatter
    fields: [order_items.sale_price_metric, products.brand, products.category]
    filters:
      order_items.sale_price_metric_picker: SUM
    sorts: [order_items.sale_price_metric desc]
    limit: 10
    dynamic_fields: [{table_calculation: mean_price, label: Mean Price, expression: 'mean(${order_items.sale_price_metric})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: distance_from_mean, label: Distance From Mean, expression: "${order_items.sale_price_metric}\
          \ - ${mean_price}", value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.sale_price_metric,
            id: order_items.sale_price_metric, name: Total Sale Price}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: distance_from_mean,
            id: distance_from_mean, name: Distance From Mean}], showLabels: true,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: order_items.sale_price_metric
    plot_size_by_field: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle_outline
    series_colors:
      order_items.sale_price_metric: "#10C871"
      distance_from_mean: "#f2f9fc"
    series_labels:
      mean_price: Mean Line - $31, 829
    series_point_styles:
      mean_price: triangle-down
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [order_items.category_count, mean_price, products.brand]
    listen: {}
    row: 2
    col: 0
    width: 10
    height: 5
  - title: Staples Brand
    name: Staples Brand
    model: NormalName
    explore: order_items
    type: table
    fields: [orders.created_date, order_items.returned_date, products.brand, order_items.sale_price_metric]
    filters:
      order_items.sale_price_metric_picker: SUM
    sorts: [order_items.returned_date desc]
    limit: 10
    dynamic_fields: [{table_calculation: mean_price, label: Mean Price, expression: 'mean(${order_items.sale_price_metric})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: distance_from_mean, label: Distance From Mean, expression: "${order_items.sale_price_metric}\
          \ - ${mean_price}", value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      mean_price: Mean Line - $31, 829
    table_theme: editable
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    enable_conditional_formatting: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.sale_price_metric,
            id: order_items.sale_price_metric, name: Total Sale Price}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: distance_from_mean,
            id: distance_from_mean, name: Distance From Mean}], showLabels: true,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: order_items.sale_price_metric
    plot_size_by_field: true
    trellis: ''
    stacking: ''
    legend_position: center
    series_types: {}
    point_style: circle_outline
    series_colors:
      order_items.sale_price_metric: "#10C871"
      distance_from_mean: "#f2f9fc"
    series_point_styles:
      mean_price: triangle-down
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [order_items.category_count, mean_price, products.brand, order_items.sale_price_metric,
      distance_from_mean]
    listen: {}
    row: 0
    col: 8
    width: 6
    height: 2
  - title: StackedwLine
    name: StackedwLine
    model: NormalName
    explore: order_items
    type: looker_column
    fields: [order_items.sale_price_metric, products.brand]
    filters:
      order_items.sale_price_metric_picker: SUM
    sorts: [order_items.sale_price_metric desc]
    limit: 10
    dynamic_fields: [{table_calculation: mean_price, label: Mean Price, expression: 'mean(${order_items.sale_price_metric})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: distance_from_mean, label: Distance From Mean, expression: "${order_items.sale_price_metric}\
          \ - ${mean_price}", value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: d3bbf1c2-a6ec-4210-b1e7-3e48461cc45b
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.sale_price_metric,
            id: order_items.sale_price_metric, name: Total Sale Price}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: distance_from_mean,
            id: distance_from_mean, name: Distance From Mean}], showLabels: true,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: order_items.sale_price_metric
    plot_size_by_field: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    legend_position: center
    series_types:
      distance_from_mean: line
    point_style: circle_outline
    series_colors:
      order_items.sale_price_metric: "#10C871"
      distance_from_mean: "#fcad61"
    series_labels:
      mean_price: Mean Line - $31, 829
    series_point_styles:
      mean_price: triangle-down
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    hidden_fields: [order_items.category_count]
    listen: {}
    row: 7
    col: 8
    width: 8
    height: 6
  - title: BarChart
    name: BarChart
    model: NormalName
    explore: order_items
    type: looker_column
    fields: [order_items.sale_price_metric, products.brand]
    filters:
      order_items.sale_price_metric_picker: SUM
    sorts: [order_items.sale_price_metric desc]
    limit: 10
    dynamic_fields: [{table_calculation: mean_price, label: Mean Price, expression: 'mean(${order_items.sale_price_metric})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: distance_from_mean, label: Distance From Mean, expression: "${order_items.sale_price_metric}\
          \ - ${mean_price}", value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.sale_price_metric,
            id: order_items.sale_price_metric, name: Total Sale Price}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: distance_from_mean,
            id: distance_from_mean, name: Distance From Mean}], showLabels: true,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: order_items.sale_price_metric
    plot_size_by_field: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle_outline
    series_colors:
      order_items.sale_price_metric: "#10C871"
      distance_from_mean: "#f2f9fc"
    series_labels:
      mean_price: Mean Line - $31, 829
    series_point_styles:
      mean_price: triangle-down
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    hidden_fields: [order_items.category_count, mean_price]
    note_state: collapsed
    note_display: hover
    note_text: Howdy Partner, how are you on this blessed day?
    listen: {}
    row: 2
    col: 10
    width: 10
    height: 5
  - title: Pie Chart
    name: Pie Chart
    model: NormalName
    explore: order_items
    type: looker_pie
    fields: [order_items.sale_price_metric, products.brand]
    filters:
      order_items.sale_price_metric_picker: SUM
    sorts: [order_items.sale_price_metric desc]
    limit: 10
    dynamic_fields: [{table_calculation: mean_price, label: Mean Price, expression: 'mean(${order_items.sale_price_metric})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: distance_from_mean, label: Distance From Mean, expression: "${order_items.sale_price_metric}\
          \ - ${mean_price}", value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da
      options:
        steps: 5
    series_colors: {}
    series_labels:
      mean_price: Mean Line - $31, 829
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.sale_price_metric,
            id: order_items.sale_price_metric, name: Total Sale Price}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: distance_from_mean,
            id: distance_from_mean, name: Distance From Mean}], showLabels: true,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: order_items.sale_price_metric
    plot_size_by_field: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle_outline
    series_point_styles:
      mean_price: triangle-down
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [order_items.category_count, mean_price, distance_from_mean]
    listen: {}
    row: 7
    col: 16
    width: 8
    height: 6
  - title: Tables Now
    name: Tables Now
    model: NormalName
    explore: order_items
    type: looker_grid
    fields: [order_items.sale_price_metric, products.brand]
    filters:
      order_items.sale_price_metric_picker: SUM
    sorts: [order_items.sale_price_metric desc]
    limit: 10
    dynamic_fields: [{table_calculation: mean_price, label: Mean Price, expression: 'mean(${order_items.sale_price_metric})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: distance_from_mean, label: Distance From Mean, expression: "${order_items.sale_price_metric}\
          \ - ${mean_price}", value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.sale_price_metric,
            id: order_items.sale_price_metric, name: Total Sale Price}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: distance_from_mean,
            id: distance_from_mean, name: Distance From Mean}], showLabels: true,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: order_items.sale_price_metric
    plot_size_by_field: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle_outline
    series_colors:
      order_items.sale_price_metric: "#10C871"
      distance_from_mean: "#f2f9fc"
    series_labels:
      mean_price: Mean Line - $31, 829
    series_point_styles:
      mean_price: triangle-down
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [order_items.category_count, mean_price]
    listen: {}
    row: 13
    col: 0
    width: 24
    height: 4
  - title: StackedwLine (copy 2)
    name: StackedwLine (copy 2)
    model: NormalName
    explore: order_items
    type: looker_grid
    fields: [order_items.sale_price_metric, products.brand, order_items.Heather, order_items.id,
      order_items.inventory_item_id, order_items.order_id, products.brand_comparitor,
      products.category, products.department_alias, products.id, products.rank_alias,
      products.item_name, products.retail_price, products.sku]
    filters:
      order_items.sale_price_metric_picker: SUM
    sorts: [order_items.sale_price_metric desc]
    limit: 10
    dynamic_fields: [{table_calculation: mean_price, label: Mean Price, expression: 'mean(${order_items.sale_price_metric})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: distance_from_mean, label: Distance From Mean, expression: "${order_items.sale_price_metric}\
          \ - ${mean_price}", value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: d3bbf1c2-a6ec-4210-b1e7-3e48461cc45b
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.sale_price_metric,
            id: order_items.sale_price_metric, name: Total Sale Price}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: distance_from_mean,
            id: distance_from_mean, name: Distance From Mean}], showLabels: true,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: order_items.sale_price_metric
    plot_size_by_field: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    legend_position: center
    series_types: {}
    point_style: circle_outline
    series_colors:
      order_items.sale_price_metric: "#10C871"
      distance_from_mean: "#fcad61"
    series_labels:
      mean_price: Mean Line - $31, 829
    series_point_styles:
      mean_price: triangle-down
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    hidden_fields: [order_items.category_count]
    listen: {}
    row: 29
    col: 0
    width: 24
    height: 7
  - title: StackedwLine (copy)
    name: StackedwLine (copy)
    model: NormalName
    explore: order_items
    type: looker_area
    fields: [products.brand, order_items.sale_price_metric]
    filters:
      order_items.sale_price_metric_picker: SUM
    sorts: [order_items.sale_price_metric desc]
    limit: 10
    dynamic_fields: [{table_calculation: mean_price, label: Mean Price, expression: 'mean(${order_items.sale_price_metric})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: distance_from_mean, label: Distance From Mean, expression: "${order_items.sale_price_metric}\
          \ - ${mean_price}", value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: d3bbf1c2-a6ec-4210-b1e7-3e48461cc45b
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.sale_price_metric,
            id: order_items.sale_price_metric, name: Total Sale Price}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: distance_from_mean,
            id: distance_from_mean, name: Distance From Mean}], showLabels: true,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: order_items.sale_price_metric
    plot_size_by_field: true
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    legend_position: center
    series_types: {}
    point_style: circle_outline
    series_colors:
      order_items.sale_price_metric: "#10C871"
      distance_from_mean: "#fcad61"
    series_labels:
      mean_price: Mean Line - $31, 829
    series_point_styles:
      mean_price: triangle-down
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    hidden_fields: [order_items.category_count, mean_price]
    listen: {}
    row: 17
    col: 0
    width: 8
    height: 6
