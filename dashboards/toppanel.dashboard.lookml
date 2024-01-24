---
- dashboard: top_panel
  title: Top panel
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: tT2FPsdoVcU5YxQ6Kqq0hd
  elements:
  - title: Top panel
    name: Top panel
    model: tp
    explore: employee
    type: tp::stats_count
    fields: [critical_issues, high_risk_issues, medium_risk_issues, low_risk_issues,
      informational_issues]
    filters:
      employee.username: ''
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Critical Issues
      based_on: employee.id
      _kind_hint: measure
      measure: critical_issues
      type: count_distinct
      _type_hint: number
    - category: measure
      expression: ''
      label: High-Risk Issues
      based_on: employee.id
      _kind_hint: measure
      measure: high_risk_issues
      type: count_distinct
      _type_hint: number
    - category: measure
      expression: ''
      label: Medium-Risk Issues
      based_on: employee.id
      _kind_hint: measure
      measure: medium_risk_issues
      type: count_distinct
      _type_hint: number
    - category: measure
      expression: ''
      label: Informational Issues
      based_on: employee.id
      _kind_hint: measure
      measure: informational_issues
      type: count_distinct
      _type_hint: number
    - category: measure
      expression: ''
      label: Low-Risk Issues
      based_on: employee.id
      _kind_hint: measure
      measure: low_risk_issues
      type: count_distinct
      _type_hint: number
    query_timezone: America/Los_Angeles
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
    title_hidden: true
    listen:
      Email ID: employee.email_id
      Date of Joining Date: employee.date_of_joining_date
    row: 0
    col: 0
    width: 24
    height: 3
  filters:
  - name: Email ID
    title: Email ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: tp
    explore: employee
    listens_to_filters: []
    field: employee.email_id
  - name: Date of Joining Date
    title: Date of Joining Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: tp
    explore: employee
    listens_to_filters: []
    field: employee.date_of_joining_date
