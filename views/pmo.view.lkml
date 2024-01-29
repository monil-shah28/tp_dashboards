view: pmo {
  sql_table_name: public.pmo ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
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
  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."end_date" ;;
  }
  dimension: estimated_hours {
    type: number
    sql: ${TABLE}."estimated_hours" ;;
  }
  dimension: internal_hours {
    type: number
    sql: ${TABLE}."internal_hours" ;;
  }
  dimension: jira_business_unit_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."jira_business_unit_id" ;;
  }
  dimension: jira_id {
    type: string
    sql: ${TABLE}."jira_id" ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."start_date" ;;
  }
  dimension: starting_quarter {
    type: string
    sql: ${TABLE}."starting_quarter" ;;
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
  dimension: year {
    type: number
    sql: ${TABLE}."year" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, jira_business_unit.id, bu_pmo.count, quarters.count]
  }
}
