view: base_location_code {
  sql_table_name: public.base_location_code ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: base_location {
    type: string
    sql: ${TABLE}."base_location" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
