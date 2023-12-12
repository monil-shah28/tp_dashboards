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
    type: looker_pie
    fields: [project.project_name, project.count]
    sorts: [project.count desc 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 0
    col: 0
    width: 13
    height: 6
  - title: Untitled
    name: Untitled
    model: tp
    explore: worklog_details
    type: looker_grid
    fields: [worklog_details.trye, project.count, pmo.jira_id, pmo.estimated_hours,
      worklog_details.is_estimated_hours_provided, worklog_details.sum_of_time_worked]
    sorts: [worklog_details.trye desc 0]
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
    value_labels: legend
    label_type: labPer
    hidden_pivots: {}
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
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    listen:
      Business Unit: hrms_business_unit.business_unit
    row: 0
    col: 13
    width: 11
    height: 6
  - title: Untitled
    name: Untitled (2)
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
    listen: {}
    row: 6
    col: 0
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
