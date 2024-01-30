view: sync_info {
  sql_table_name: public.sync_info ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: app_name {
    type: string
    sql: ${TABLE}."app_name" ;;
  }
  dimension: last_synced_by {
    type: number
    sql: ${TABLE}."last_synced_by" ;;
  }
  dimension_group: last_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."last_synced_on" ;;
  }
  dimension_group: last_synced_on_client {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."last_synced_on_client" ;;
  }
  dimension: sync_error {
    type: string
    sql: ${TABLE}."sync_error" ;;
  }
  dimension: sync_status {
    type: string
    sql: ${TABLE}."sync_status" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, app_name]
  }
}
