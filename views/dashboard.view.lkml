view: dashboard {
  sql_table_name: public.dashboard ;;
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
  dimension: dashboard_name {
    type: string
    sql: ${TABLE}."dashboard_name" ;;
  }
  dimension: default {
    type: yesno
    sql: ${TABLE}."default" ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
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
    drill_fields: [id, dashboard_name, dashboard_graph.count]
  }
}
