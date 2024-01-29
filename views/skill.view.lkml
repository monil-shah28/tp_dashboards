view: skill {
  sql_table_name: public.skill ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: skill_name {
    type: string
    sql: ${TABLE}."skill_name" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, skill_name]
  }
}
