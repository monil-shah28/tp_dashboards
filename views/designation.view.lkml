view: designation {
  sql_table_name: public.designation ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: designation_name {
    type: string
    sql: ${TABLE}."designation_name" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, designation_name, employee.count]
  }
}
