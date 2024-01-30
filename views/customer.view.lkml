view: customer {
  sql_table_name: public.customer ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: customer_name {
    type: string
    sql: ${TABLE}."customer_name" ;;
  }
  dimension: updated_by {
    type: number
    sql: ${TABLE}."updated_by" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_on" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, customer_name, bd.count]
  }
}
