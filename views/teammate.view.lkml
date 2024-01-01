view: teammate {
  sql_table_name: public.teammate ;;
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
  dimension: employee_bu_id {
    type: number
    sql: ${TABLE}."employee_bu_id" ;;
  }
  dimension: employee_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."employee_id" ;;
  }
  dimension: ld_key {
    type: string
    sql: ${TABLE}."ld_key" ;;
  }
  dimension: request_id {
    type: number
    sql: ${TABLE}."request_id" ;;
  }
  dimension: suggested_by {
    type: string
    sql: ${TABLE}."suggested_by" ;;
  }
  dimension: team_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."team_id" ;;
  }
  dimension: teammate_status {
    type: yesno
    sql: ${TABLE}."teammate_status" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	team.id,
	allocation_role.id,
	allocation_type.id,
	employee.username,
	employee.employee_id,
	employee.company_name,
	employee.employee_name
	]
  }

}
