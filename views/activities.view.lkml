view: activities {
  sql_table_name: public.activities ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: activity {
    type: string
    sql: ${TABLE}."activity" ;;
  }
  dimension: request_id {
    type: number
    sql: ${TABLE}."request_id" ;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."timestamp" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
