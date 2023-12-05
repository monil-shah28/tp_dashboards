view: jira_business_unit {
  sql_table_name: public.jira_business_unit ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: business_unit {
    type: string
    sql: ${TABLE}."business_unit" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, learning_development.count, pmo.count]
  }
}
