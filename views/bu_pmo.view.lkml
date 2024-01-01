view: bu_pmo {
  sql_table_name: public.bu_pmo ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: bu_id {
    type: number
    sql: ${TABLE}."bu_id" ;;
  }
  dimension: pmo_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."pmo_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, pmo.id]
  }
}
