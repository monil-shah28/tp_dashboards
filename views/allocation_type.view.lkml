view: allocation_type {
  sql_table_name: public.allocation_type ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: allocation_type {
    type: string
    sql: ${TABLE}."allocation_type" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, team.count, teammate.count]
  }
}
