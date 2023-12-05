view: milestones {
  sql_table_name: public.milestones ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension_group: bd_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."bd_end_date" ;;
  }
  dimension: contract_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."contract_id" ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: invoice_done {
    type: string
    sql: ${TABLE}."invoice_done" ;;
  }
  dimension: milestone {
    type: string
    sql: ${TABLE}."milestone" ;;
  }
  dimension: pmo_done {
    type: yesno
    sql: ${TABLE}."pmo_done" ;;
  }
  dimension_group: pmo_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."pmo_end_date" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, contracts.id]
  }
}
