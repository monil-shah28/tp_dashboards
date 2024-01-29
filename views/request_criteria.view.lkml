view: request_criteria {
  sql_table_name: public.request_criteria ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: allocation_role_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."allocation_role_id" ;;
  }
  dimension: experience {
    type: string
    sql: ${TABLE}."experience" ;;
  }
  dimension: no_of_allocated_teammates {
    type: number
    sql: ${TABLE}."no_of_allocated_teammates" ;;
  }
  dimension: no_of_requested_teammates {
    type: number
    sql: ${TABLE}."no_of_requested_teammates" ;;
  }
  dimension: remarks {
    type: string
    sql: ${TABLE}."remarks" ;;
  }
  dimension: request_id {
    type: number
    sql: ${TABLE}."request_id" ;;
  }
  dimension: skill_with_rating {
    type: string
    sql: ${TABLE}."skill_with_rating" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, allocation_role.id]
  }
}
