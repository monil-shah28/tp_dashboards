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
  measure: billable {
    type: count
    filters: [
      team.allocation_type_id: "1"
    ]
  }
  measure: billable_buffer {
    type: count
    filters: [
      team.allocation_type_id: "2"
    ]
  }
  measure: buffer {
    type: count
    filters: [
      team.allocation_type_id: "4"
    ]
  }
  measure: LD {
    type: count
    filters: [
      team.allocation_type_id: "11"
    ]
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: Billable_ratio {
    type: number
    sql:CAST(${billable} AS FLOAT) / CAST(${count} AS FLOAT) ;;
    value_format: "0.00"
  }
  measure: Billable_buffer_ratio {
    type: number
    sql:CAST(${billable_buffer} AS FLOAT) / CAST(${count} AS FLOAT) ;;
    value_format: "0.00"
  }
  measure: buffer_ratio {
    type: number
    sql:CAST(${buffer} AS FLOAT) / CAST(${count} AS FLOAT) ;;
    value_format: "0.00"
  }
  measure: LD_ratio {
    type: number
    sql:CAST(${LD} AS FLOAT) / CAST(${count} AS FLOAT);;
    value_format: "0.00"
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
