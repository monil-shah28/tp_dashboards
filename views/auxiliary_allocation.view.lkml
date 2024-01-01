view: auxiliary_allocation {
  sql_table_name: public.auxiliary_allocation ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: created_by {
    type: number
    sql: ${TABLE}."created_by" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_on" ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."end_date" ;;
  }
  dimension: project_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."project_id" ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."start_date" ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, project.project_name, project.id, project.epic_name]
  }
}
