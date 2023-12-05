view: team {
  sql_table_name: public.team ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension_group: allocation_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."allocation_end_date" ;;
  }
  dimension: allocation_percentage {
    type: number
    sql: ${TABLE}."allocation_percentage" ;;
  }
  dimension: allocation_role_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."allocation_role_id" ;;
  }
  dimension_group: allocation_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."allocation_start_date" ;;
  }
  dimension: allocation_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."allocation_type_id" ;;
  }
  dimension: created_by {
    type: string
    sql: ${TABLE}."created_by" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_on" ;;
  }
  dimension: employee_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."employee_id" ;;
  }
  dimension: epic_id {
    type: string
    sql: ${TABLE}."epic_id" ;;
  }
  dimension: ld_key {
    type: string
    sql: ${TABLE}."ld_key" ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }
  dimension: updated_by {
    type: string
    sql: ${TABLE}."updated_by" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_on" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	allocation_role.id,
	allocation_type.id,
	employee.username,
	employee.employee_id,
	employee.company_name,
	employee.employee_name,
	teammate.count
	]
  }

}
