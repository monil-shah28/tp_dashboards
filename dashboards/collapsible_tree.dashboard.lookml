- dashboard: collapsible_tree
  title: Collapsible Tree
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: QofeOnG2FyLcaQ0Fj6gpsf
  elements:
  - title: Collapsible Tree using CDN
    name: Collapsible Tree using CDN
    model: tp
    explore: team
    type: collapsible_tree
    fields: [employee.employee_name, allocation_role.allocation_role, hrms_business_unit.business_unit,
      project.project_name, allocation_type.allocation_type, project.project_lead]
    sorts: [employee.employee_name]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 6
  - title: collapsible_tree
    name: collapsible_tree
    model: tp
    explore: team
    type: tp::collapse
    fields: [employee.employee_name, project.project_name, project.project_lead, hrms_business_unit.business_unit]
    sorts: [employee.employee_name]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    row: 6
    col: 0
    width: 24
    height: 8
