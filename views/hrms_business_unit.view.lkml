view: hrms_business_unit {
  sql_table_name: public.hrms_business_unit ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: bu_lead_id {
    type: number
    sql: ${TABLE}."bu_lead_id" ;;
  }
  dimension: business_unit {
    type: string
    sql: ${TABLE}."business_unit" ;;
  }
  dimension: short_form {
    type: string
    sql: ${TABLE}."short_form" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, employee.count]
  }
}
