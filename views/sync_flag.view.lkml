view: sync_flag {
  sql_table_name: public.sync_flag ;;
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
  dimension: is_in_sync_currently {
    type: yesno
    sql: ${TABLE}."is_in_sync_currently" ;;
  }
  dimension_group: last_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."last_synced_on" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, app_name]
  }
}
