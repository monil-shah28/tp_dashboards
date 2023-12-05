view: email_templates {
  sql_table_name: public.email_templates ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_on" ;;
  }
  dimension: template_body {
    type: string
    sql: ${TABLE}."template_body" ;;
  }
  dimension: template_name {
    type: string
    sql: ${TABLE}."template_name" ;;
  }
  dimension: template_type {
    type: string
    sql: ${TABLE}."template_type" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, template_name]
  }
}
