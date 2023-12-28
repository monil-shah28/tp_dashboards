- dashboard: tp_scenarios
  title: TP Scenarios
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: w63wX2xZF5BSwBsgOlxTxy
  elements:
  - title: BU wise Employee Allocation
    name: BU wise Employee Allocation
    model: tp
    explore: team
    type: looker_area
    fields: [hrms_business_unit.business_unit, employee.count]
    sorts: [hrms_business_unit.business_unit]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_labels:
      employee.count: Count of Employee
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    ordering: none
    show_null_labels: false
    row: 0
    col: 0
    width: 24
    height: 6
  - title: Date wise Employee Allocation in BU
    name: Date wise Employee Allocation in BU
    model: tp
    explore: team
    type: looker_area
    fields: [team.allocation_start_date, team.allocation_end_date, employee.count]
    filters:
      hrms_business_unit.business_unit: DevOps & Automation (DA),ServiceNow Business
        Unit (SNBU),Ecosystem Engineering Business Unit (EEBU)
    sorts: [team.allocation_start_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      employee.count: Employee Count
    defaults_version: 1
    ordering: none
    show_null_labels: false
    value_labels: legend
    label_type: labPer
    row: 6
    col: 0
    width: 12
    height: 8
  - title: BU Information (Sankey)
    name: BU Information (Sankey)
    model: tp
    explore: team
    type: sankey
    fields: [hrms_business_unit.business_unit, project.project_lead, project.project_name,
      employee.employee_name, employee.count]
    sorts: [employee.count desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    label_type: name
    show_null_points: false
    defaults_version: 0
    row: 14
    col: 0
    width: 24
    height: 15
  - title: BU and Project wise Employee Count (Subtotal)
    name: BU and Project wise Employee Count (Subtotal)
    model: tp
    explore: jira_business_unit
    type: subtotal
    fields: [employee.count, jira_business_unit.business_unit, project.project_name]
    filters:
      project.project_name: "-NULL"
    sorts: [employee.count desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    theme: classic
    show_full_field_name: false
    defaults_version: 0
    row: 6
    col: 12
    width: 12
    height: 8
  - title: Project wise Logged Hours (chord)
    name: Project wise Logged Hours (chord)
    model: tp
    explore: project
    type: chord
    fields: [project.logged_hours, project.project_name, project.count]
    sorts: [project.logged_hours]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_logged_hours
      based_on: project.logged_hours
      expression: ''
      label: Count of Logged Hours
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    hidden_pivots: {}
    row: 29
    col: 0
    width: 12
    height: 9
  - title: Employee allocation in Project BU wise (liquid fill gauge)
    name: Employee allocation in Project BU wise (liquid fill gauge)
    model: tp
    explore: team
    type: liquid fill gauge
    fields: [employee.count, project.count]
    filters:
      hrms_business_unit.business_unit: DevOps & Automation (DA),Product & Solutions
        (PS)
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    showComparison: true
    circleThickness: 0.15
    circleFillGap: 0.55
    circleColor: "#079c98"
    waveHeight: 0.5
    waveCount: 5
    waveRiseTime: 2500
    waveAnimateTime: 2500
    waveRise: true
    waveHeightScaling: true
    waveAnimate: true
    waveColor: "#9334E6"
    waveOffset: 0.5
    textVertPosition: 0.5
    textSize: 0.5
    valueCountUp: true
    displayPercent: true
    textColor: "#F9AB00"
    waveTextColor: "#80868B"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 0
    listen: {}
    row: 29
    col: 12
    width: 12
    height: 9
