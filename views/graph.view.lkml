view: graph {
  sql_table_name: public.graph ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}."category" ;;
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
  dimension: filter {
    type: string
    sql: ${TABLE}."filter" ;;
  }
  dimension: graph_type {
    type: string
    sql: ${TABLE}."graph_type" ;;
  }
  dimension: method_type {
    type: string
    sql: ${TABLE}."method_type" ;;
  }
  dimension: show_timeframe {
    type: string
    sql: ${TABLE}."show_timeframe" ;;
  }
  dimension: sub_endpoint {
    type: string
    sql: ${TABLE}."sub_endpoint" ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
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
    drill_fields: [id, dashboard_graph.count]
  }
}
