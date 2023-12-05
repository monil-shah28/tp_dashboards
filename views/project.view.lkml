view: project {
  sql_table_name: public.project ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: bd_estimated {
    type: string
    sql: ${TABLE}."bd_estimated" ;;
  }
  dimension: bd_supported_estimated_hours {
    type: string
    sql: ${TABLE}."bd_supported_estimated_hours" ;;
  }
  dimension_group: completed {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."completed_date" ;;
  }
  dimension: crm_order_number {
    type: string
    sql: ${TABLE}."crm_order_number" ;;
  }
  dimension: epic_id {
    type: string
    sql: ${TABLE}."epic_id" ;;
  }
  dimension: epic_name {
    type: string
    sql: ${TABLE}."epic_name" ;;
  }
  dimension_group: jira_created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."jira_created_date" ;;
  }
  dimension: jira_id {
    type: string
    sql: ${TABLE}."jira_id" ;;
  }
  dimension: jira_status {
    type: string
    sql: ${TABLE}."jira_status" ;;
  }
  dimension: logged_hours {
    type: number
    sql: ${TABLE}."logged_hours" ;;
  }
  dimension: pmo {
    type: string
    sql: ${TABLE}."pmo" ;;
  }
  dimension: pmo_email_id {
    type: string
    sql: ${TABLE}."pmo_email_id" ;;
  }
  dimension: pmo_revised_estimated {
    type: string
    sql: ${TABLE}."pmo_revised_estimated" ;;
  }
  dimension: project_key {
    type: string
    sql: ${TABLE}."project_key" ;;
  }
  dimension: project_lead {
    type: string
    sql: ${TABLE}."project_lead" ;;
  }
  dimension: project_lead_email_id {
    type: string
    sql: ${TABLE}."project_lead_email_id" ;;
  }
  dimension: project_name {
    type: string
    sql: ${TABLE}."project_name" ;;
  }
  dimension: qa_lead {
    type: string
    sql: ${TABLE}."qa_lead" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, project_name, epic_name, auxiliary_allocation.count]
  }
}
