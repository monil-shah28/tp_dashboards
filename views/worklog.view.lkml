view: worklog {
  sql_table_name: public.worklog ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: employee_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."employee_id" ;;
  }
  dimension: log_date {
    type: number
    sql: ${TABLE}."log_date" ;;
  }
  dimension: month_id {
    type: number
    sql: ${TABLE}."month_id" ;;
  }
  dimension: reason {
    type: string
    sql: ${TABLE}."reason" ;;
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
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	employee.username,
	employee.employee_id,
	employee.company_name,
	employee.employee_name,
	worklog_details.count
	]
  }

}
