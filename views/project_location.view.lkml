view: project_location {
  sql_table_name: public.project_location ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: jira_id {
    type: string
    sql: ${TABLE}."jira_id" ;;
  }
  dimension: location {
    type: string
    sql: ${TABLE}."location" ;;
  }
  dimension: referred_by {
    type: string
    sql: ${TABLE}."referred_by" ;;
  }
  dimension: updated_by {
    type: number
    sql: ${TABLE}."updated_by" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_on" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
