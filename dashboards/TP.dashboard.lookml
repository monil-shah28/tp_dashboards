- dashboard: tp_employee
  title: TP Employee
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: itcLD6QLmNgUdNDtbdr0h9
  elements:
  - title: Employee Allocation per BU tree map
    name: Employee Allocation per BU tree map
    model: tp
    explore: employee
    type: test_mysql_nikhil::simple_treemap
    fields: [hrms_business_unit.business_unit, employee.count]
    sorts: [employee.count desc 0]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    defaults_version: 0
    hidden_pivots: {}
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 0
    col: 0
    width: 8
    height: 7
  - title: Timesheet defaulters
    name: Timesheet defaulters
    model: tp
    explore: worklog_details
    type: looker_pie
    fields: [hrms_business_unit.business_unit, worklog_details.count]
    filters:
      worklog_details.time_worked: "<7"
    sorts: [worklog_details.count desc 0]
    limit: 5000
    column_limit: 50
    value_labels: legend
    label_type: labPer
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 0
    col: 16
    width: 8
    height: 7
  - title: Treemap with grade wise employees with drill down
    name: Treemap with grade wise employees with drill down
    model: tp
    explore: employee
    type: test_mysql_nikhil::treemap_hover
    fields: [grade.grade, employee.count]
    sorts: [grade.grade]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 7
    col: 16
    width: 8
    height: 6
  - title: Pie chart with billable, billable buffer, buffer and LD - Org wise and
      BU wise
    name: Pie chart with billable, billable buffer, buffer and LD - Org wise and BU
      wise
    model: tp
    explore: team
    type: looker_pie
    fields: [allocation_type.allocation_type, employee.count]
    filters:
      allocation_type.allocation_type: Billable,Billable Buffer,Buffer,General LD
    sorts: [employee.count desc 0]
    limit: 50
    column_limit: 50
    value_labels: legend
    label_type: labPer
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 0
    col: 8
    width: 8
    height: 7
  - title: employee count per BU
    name: employee count per BU
    model: tp
    explore: employee
    type: test_mysql_nikhil::custom_table_viz
    fields: [employee.count, hrms_business_unit.business_unit]
    sorts: [employee.count desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
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
    value_labels: legend
    label_type: labPer
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 13
    col: 8
    width: 8
    height: 6
  - title: Project List
    name: Project List
    model: tp
    explore: team
    type: looker_grid
    fields: [project.project_name, employee.count]
    sorts: [employee.count desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 7
    col: 8
    width: 8
    height: 6
  - title: project count per BU
    name: project count per BU
    model: tp
    explore: team
    type: looker_scatter
    fields: [hrms_business_unit.business_unit, project.count]
    sorts: [project.count desc 0]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 7
    col: 0
    width: 8
    height: 6
  - title: Untitled
    name: Untitled
    model: tp
    explore: worklog_details
    type: looker_grid
    fields: [project.project_name, worklog_details.time_worked]
    sorts: [project.project_name]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 19
    col: 8
    width: 8
    height: 6
  filters:
  - name: Business Unit
    title: Business Unit
    type: field_filter
    default_value: SAA,EEBU,SGDI
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: tp
    explore: worklog_details
    listens_to_filters: []
    field: hrms_business_unit.business_unit
