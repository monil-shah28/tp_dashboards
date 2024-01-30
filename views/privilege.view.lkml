view: privilege {
  sql_table_name: public.privilege ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: permission_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."permission_id" ;;
  }
  dimension: resource_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."resource_id" ;;
  }
  dimension: role_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."role_id" ;;
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
	resource.id,
	resource.name,
	role.id,
	role.name,
	permission.id,
	permission.name
	]
  }

}
