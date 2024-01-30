view: allocation_role {
  sql_table_name: public.allocation_role ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: allocation_role {
    type: string
    sql: ${TABLE}."allocation_role" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, request_criteria.count, team.count, teammate.count]
  }
}
