- dashboard: nested_treemap
  title: Nested treemap
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: exUx7Rl5tuLy9H38RwIGMe
  elements:
  - title: 'Cascaded treemap (Developed) '
    name: 'Cascaded treemap (Developed) '
    model: tp
    explore: team
    type: test_mysql_nikhil::cascade_treemap
    fields: [hrms_business_unit.business_unit, project.project_name, employee.employee_name,
      team.allocation_percentage]
    sorts: [hrms_business_unit.business_unit]
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
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 10
  - title: Cascaded Treemap (Observable Code)
    name: Cascaded Treemap (Observable Code)
    model: tp
    explore: team
    type: test_mysql_nikhil::cascade_treemap_with_obserable_code
    fields: [hrms_business_unit.business_unit, project.project_name, employee.employee_name,
      team.allocation_percentage]
    sorts: [hrms_business_unit.business_unit]
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
    listen: {}
    row: 10
    col: 0
    width: 24
    height: 10
