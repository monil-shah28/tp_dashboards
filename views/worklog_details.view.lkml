view: worklog_details {
  sql_table_name: public.worklog_details ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: epic_id {
    type: number
    sql: ${TABLE}."epic_id" ;;
  }
  dimension: ld_id {
    type: number
    sql: ${TABLE}."ld_id" ;;
  }
  dimension: time_worked {
    type: number
    sql: ${TABLE}."time_worked" ;;
  }
  dimension: worklog_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."worklog_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, worklog.id]
  }
}
