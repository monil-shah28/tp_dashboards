view: contracts {
  sql_table_name: public.contracts ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: bd_description {
    type: string
    sql: ${TABLE}."bd_description" ;;
  }
  dimension: bd_owner_id {
    type: number
    sql: ${TABLE}."bd_owner_id" ;;
  }
  dimension: billability_count {
    type: number
    sql: ${TABLE}."billability_count" ;;
  }
  dimension: contract_time {
    type: string
    sql: ${TABLE}."contract_time" ;;
  }
  dimension: contract_type {
    type: string
    sql: ${TABLE}."contract_type" ;;
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
  dimension: jira_id {
    type: string
    sql: ${TABLE}."jira_id" ;;
  }
  dimension: po_status {
    type: string
    sql: ${TABLE}."po_status" ;;
  }
  dimension: so_number {
    type: string
    sql: ${TABLE}."so_number" ;;
  }
  dimension: type_of_service {
    type: string
    sql: ${TABLE}."type_of_service" ;;
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
    drill_fields: [id, milestones.count]
  }
}
