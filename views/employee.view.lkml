view: employee {
  sql_table_name: public.employee ;;
  drill_fields: [employee_id]

  dimension: employee_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."employee_id" ;;
  }
  dimension: base_location {
    type: number
    sql: ${TABLE}."base_location" ;;
  }
  dimension: company_name {
    type: string
    sql: ${TABLE}."company_name" ;;
  }
  dimension: crest_experience {
    type: number
    sql: ${TABLE}."crest_experience" ;;
  }
  dimension_group: date_of_joining {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date_of_joining" ;;
  }
  dimension_group: date_of_leaving {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date_of_leaving" ;;
  }
  dimension: designation_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."designation_id" ;;
  }
  dimension: direct_manager_id {
    type: number
    sql: ${TABLE}."direct_manager_id" ;;
  }
  dimension: email_id {
    type: string
    sql: ${TABLE}."email_id" ;;
  }
  dimension: employee_name {
    type: string
    sql: ${TABLE}."employee_name" ;;
  }
  dimension: geographical_calendar_id {
    type: number
    sql: ${TABLE}."geographical_calendar_id" ;;
  }
  dimension: grade {
    type: number
    sql: ${TABLE}."grade" ;;
  }
  dimension: hrms_business_unit_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."hrms_business_unit_id" ;;
  }
  dimension: id {
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension_group: internship {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."internship_date" ;;
  }
  dimension: performance_rating {
    type: string
    sql: ${TABLE}."performance_rating" ;;
  }
  dimension: role_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."role_id" ;;
  }
  dimension: skills_with_rating {
    type: string
    sql: ${TABLE}."skills_with_rating" ;;
  }
  dimension: status {
    type: yesno
    sql: ${TABLE}."status" ;;
  }
  dimension: total_experience {
    type: number
    sql: ${TABLE}."total_experience" ;;
  }
  dimension: username {
    type: string
    sql: ${TABLE}."username" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	employee_id,
	username,
	company_name,
	employee_name,
	role.id,
	role.name,
	hrms_business_unit.id,
	designation.designation_name,
	designation.id,
	team.count,
	teammate.count,
	worklog.count
	]
  }

}
