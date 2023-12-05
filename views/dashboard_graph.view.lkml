view: dashboard_graph {
  sql_table_name: public.dashboard_graph ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: dashboard_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."dashboard_id" ;;
  }
  dimension: graph_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."graph_id" ;;
  }
  dimension: x_coordinate {
    type: number
    sql: ${TABLE}."x_coordinate" ;;
  }
  dimension: y_coordinate {
    type: number
    sql: ${TABLE}."y_coordinate" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, dashboard.id, dashboard.dashboard_name, graph.id]
  }
}
