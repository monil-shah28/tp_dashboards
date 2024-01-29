- dashboard: project_overrun
  title: Project OverRun
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Rc8frZcbu2I6WeSeCxFukJ
  elements:
  - title: BU wise Project
    name: BU wise Project
    model: tp
    explore: worklog_details
    type: test_mysql_nikhil::pie_chart
    fields: [project.project_name, project.count]
    sorts: [project.count desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    value_labels: legend
    label_type: labPer
    defaults_version: 0
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 0
    col: 0
    width: 7
    height: 6
  - title: 'Project OverRun '
    name: 'Project OverRun '
    model: tp
    explore: worklog_details
    type: looker_grid
    fields: [worklog_details.overrun, pmo.jira_id, pmo.estimated_hours, project.logged_hours]
    sorts: [worklog_details.overrun]
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
    row: 0
    col: 7
    width: 8
    height: 6
  - title: "% of project on rish of overrunning"
    name: "% of project on rish of overrunning"
    model: tp
    explore: worklog_details
    type: looker_pie
    fields: [worklog_details.overrun, project.count]
    sorts: [project.count desc 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
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
    defaults_version: 1
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 0
    col: 15
    width: 9
    height: 6
  - title: " project wise ratio "
    name: " project wise ratio "
    model: tp
    explore: team
    type: looker_column
    fields: [allocation_type.allocation_type, project.count]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 6
    col: 0
    width: 8
    height: 6
  - title: "% resource utilisation"
    name: "% resource utilisation"
    model: tp
    explore: team
    type: test_mysql_nikhil::Pie_chart_table
    fields: [allocation_type.allocation_type, employee.count]
    filters:
      allocation_type.allocation_type: Buffer,General LD
    sorts: [employee.count desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    value_labels: legend
    label_type: labPer
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
    x_axis_zoom: true
    y_axis_zoom: true
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
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: ''
    custom_y_column: ''
    custom_value_label_column: ''
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    interpolation: linear
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 6
    col: 8
    width: 8
    height: 6
  - title: BU wise epic
    name: BU wise epic
    model: tp
    explore: worklog_details
    type: looker_grid
    fields: [project.epic_id, project.count, project.jira_status]
    sorts: [project.count desc 0]
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
    defaults_version: 1
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 6
    col: 16
    width: 8
    height: 6
  - title: Untitled
    name: Untitled
    model: tp
    explore: team
    type: looker_column
    fields: [team.count, team.billable, team.billable_buffer, team.buffer, team.LD]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 12
    col: 0
    width: 8
    height: 6
  - title: " project wise ratio "
    name: " project wise ratio  (2)"
    model: tp
    explore: team
    type: looker_column
    fields: [team.buffer_ratio, team.Billable_ratio, team.Billable_buffer_ratio, team.LD_ratio]
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
    stacking: percent
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
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: ''
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 12
    col: 8
    width: 8
    height: 6
  filters:
  - name: Business Unit
    title: Business Unit
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: tp
    explore: worklog_details
    listens_to_filters: []
    field: hrms_business_unit.business_unit
