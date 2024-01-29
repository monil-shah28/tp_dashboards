view: timesheet_monthly_status {
  sql_table_name: public.timesheet_monthly_status ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: lock_type {
    type: string
    sql: ${TABLE}."lock_type" ;;
  }
  dimension: month {
    type: number
    sql: ${TABLE}."month" ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }
  dimension: status_update_by {
    type: number
    sql: ${TABLE}."status_update_by" ;;
  }
  dimension_group: status_update {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."status_update_date" ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}."year" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
