view: request_team {
  sql_table_name: public.request_team ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: created_by {
    type: number
    sql: ${TABLE}."created_by" ;;
  }
  dimension: epic_id {
    type: string
    sql: ${TABLE}."epic_id" ;;
  }
  dimension: epic_pmo_name {
    type: string
    sql: ${TABLE}."epic_pmo_name" ;;
  }
  dimension: reason {
    type: string
    sql: ${TABLE}."reason" ;;
  }
  dimension: request_type {
    type: string
    sql: ${TABLE}."request_type" ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: updated_by {
    type: number
    sql: ${TABLE}."updated_by" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, epic_pmo_name]
  }
}
