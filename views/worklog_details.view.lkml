view: worklog_details {
  sql_table_name: public.worklog_details ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: epic_id {
    type: number
    sql: ${TABLE}."epic_id" ;;
  }
  dimension: ld_id {
    type: number
    sql: ${TABLE}."ld_id" ;;
  }
  dimension: time_worked {
    type: number
    sql: ${TABLE}."time_worked" ;;
  }
  dimension: worklog_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."worklog_id" ;;
  }

  dimension: is_estimated_hours_provided {
    sql: CASE
    WHEN ${pmo.estimated_hours} IS NULL
    THEN 'false'
    ELSE 'true'
    END;;
  }
  dimension: estimated_hours_sum {
    sql:${pmo.estimated_hours};;
  }
  dimension: worklog_hours_sum {
    sql:${time_worked};;
  }
  measure: trye {
    sql:
    CASE
    WHEN SUM(${pmo.estimated_hours}) <= SUM(${time_worked})
    THEN 'Project run on Time'
    ELSE 'Project OverRun'
    END;;
    drill_fields: [bd.status,project.project_name,employee.employee_name,contracts.contract_type]
  }
  measure: sum_of_time_worked {
    type: sum
    sql: ${time_worked};;
  }

  measure: count {
    type: count
    # drill_fields: [id, worklog.id]
  }
}
