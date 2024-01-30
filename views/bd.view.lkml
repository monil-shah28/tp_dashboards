view: bd {
  sql_table_name: public.bd ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: approval_confidence {
    type: number
    sql: ${TABLE}."approval_confidence" ;;
  }
  dimension: comment {
    type: string
    sql: ${TABLE}."comment" ;;
  }
  dimension: created_by {
    type: number
    sql: ${TABLE}."created_by" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_on" ;;
  }
  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."customer_id" ;;
  }
  dimension_group: dev_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."dev_end_date" ;;
  }
  dimension_group: dev_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."dev_start_date" ;;
  }
  dimension: jira_id {
    type: string
    sql: ${TABLE}."jira_id" ;;
  }
  dimension: rd_select_list {
    type: string
    sql: ${TABLE}."rd_select_list" ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
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
    drill_fields: [id, customer.customer_name, customer.id]
  }
}
