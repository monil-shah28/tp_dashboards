view: grade {
  sql_table_name: public.grade ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: grade {
    type: string
    sql: ${TABLE}."grade" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
