view: location {
  sql_table_name: public.location ;;
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
  dimension: location {
    type: string
    sql: ${TABLE}."location" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
