---
- dashboard: one_copy
  title: One Copy
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: MZD1toQ0qdQIN4NIMox2yX
  elements:
  - title: poc
    name: poc
    model: shpoc
    explore: poc
    type: table
    fields: [poc.email_id, poc.id, poc.time_poc_dimension]
    sorts: [poc.time_poc_dimension desc]
    limit: 500
    column_limit: 50
    listen:
      Time Poc: poc.time_poc
      Username: poc.username
    row: 0
    col: 0
    width: 8
    height: 6
  - type: button
    name: button_91
    rich_content_json: '{"text":"Low","description":"","newTab":false,"alignment":"center","size":"medium","style":"FILLED","color":"#E52592","href":"https://40f7f28e-b4d6-445a-963a-9529a73a3172.looker.app/embed/dashboards/21"}'
    row: 0
    col: 21
    width: 3
    height: 1
  filters:
  - name: Time Poc
    title: Time Poc
    type: field_filter
    default_value: 15 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - 15 days
      - 30 days
    model: shpoc
    explore: poc
    listens_to_filters: []
    field: poc.time_poc
  - name: Username
    title: Username
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: shpoc
    explore: poc
    listens_to_filters: []
    field: poc.username
