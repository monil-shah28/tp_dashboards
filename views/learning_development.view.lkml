view: learning_development {
  sql_table_name: public.learning_development ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: assignee {
    type: string
    sql: ${TABLE}."assignee" ;;
  }
  dimension: assignee_email_id {
    type: string
    sql: ${TABLE}."assignee_email_id" ;;
  }
  dimension: epic_id {
    type: string
    sql: ${TABLE}."epic_id" ;;
  }
  dimension: jira_business_unit_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."jira_business_unit_id" ;;
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
  dimension: key {
    type: string
    sql: ${TABLE}."key" ;;
  }
  dimension: logged_hours {
    type: number
    sql: ${TABLE}."logged_hours" ;;
  }
  dimension_group: pmo_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."pmo_end_date" ;;
  }
  dimension_group: pmo_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."pmo_start_date" ;;
  }
  dimension: reviewer {
    type: string
    sql: ${TABLE}."reviewer" ;;
  }
  dimension: reviewer_email_id {
    type: string
    sql: ${TABLE}."reviewer_email_id" ;;
  }
  dimension: summary {
    type: string
    sql: ${TABLE}."summary" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, jira_business_unit.id]
  }
}
