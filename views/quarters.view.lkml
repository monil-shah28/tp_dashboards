view: quarters {
  sql_table_name: public.quarters ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: hours {
    type: number
    sql: ${TABLE}."hours" ;;
  }
  dimension: pmo_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."pmo_id" ;;
  }
  dimension: quarter {
    type: string
    sql: ${TABLE}."quarter" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, pmo.id]
  }
}
