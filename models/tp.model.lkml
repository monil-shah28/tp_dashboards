connection: "tp"

# include all the views
include: "/views/**/*.view.lkml"
include: "/**/*.view.lkml"
include: "/dashboards/*.dashboard"

datagroup: tp_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: tp_default_datagroup
explore: ld_per_bu {}
explore: activities {}

explore: alembic_version {}

explore: allocation_role {}

explore: allocation_type {

}

explore: auxiliary_allocation {
  join: project {
    type: left_outer
    sql_on: ${auxiliary_allocation.project_id} = ${project.id} ;;
    relationship: many_to_one
  }
}

explore: base_location_code {}

explore: bd {
  join: customer {
    type: left_outer
    sql_on: ${bd.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }
  join: project {
    type: left_outer
    sql_on: ${bd.jira_id} = ${project.id} ;;
    relationship: many_to_one
  }
}

explore: bu_pmo {
  join: pmo {
    type: left_outer
    sql_on: ${bu_pmo.pmo_id} = ${pmo.id} ;;
    relationship: many_to_one
  }

  join: jira_business_unit {
    type: left_outer
    sql_on: ${pmo.jira_business_unit_id} = ${jira_business_unit.id} ;;
    relationship: many_to_one
  }
}

explore: contracts {}

explore: customer {}

explore: dashboard {}

explore: dashboard_graph {
  join: dashboard {
    type: left_outer
    sql_on: ${dashboard_graph.dashboard_id} = ${dashboard.id} ;;
    relationship: many_to_one
  }

  join: graph {
    type: left_outer
    sql_on: ${dashboard_graph.graph_id} = ${graph.id} ;;
    relationship: many_to_one
  }
}

explore: designation {}

explore: email_templates {}

explore: employee {
  join: role {
    type: left_outer
    sql_on: ${employee.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: hrms_business_unit {
    type: left_outer
    sql_on: ${employee.hrms_business_unit_id} = ${hrms_business_unit.id} ;;
    relationship: many_to_one
  }

  join: designation {
    type: left_outer
    sql_on: ${employee.designation_id} = ${designation.id} ;;
    relationship: many_to_one
  }
  join: grade {
    type: left_outer
    sql_on: ${employee.grade} = ${grade.id};;
    relationship: many_to_one
  }
}

explore: grade {}

explore: graph {}

explore: hrms_business_unit {
  join: employee {
    type: left_outer
    sql_on: ${hrms_business_unit.id} = ${employee.hrms_business_unit_id} ;;
    relationship: many_to_one
  }
}

explore: jira_business_unit {}

explore: learning_development {
  join: jira_business_unit {
    type: left_outer
    sql_on: ${learning_development.jira_business_unit_id} = ${jira_business_unit.id} ;;
    relationship: many_to_one
  }
}

explore: location {}

explore: milestones {
  join: contracts {
    type: left_outer
    sql_on: ${milestones.contract_id} = ${contracts.id} ;;
    relationship: many_to_one
  }
}

explore: permission {}

explore: pmo {
  join: jira_business_unit {
    type: left_outer
    sql_on: ${pmo.jira_business_unit_id} = ${jira_business_unit.id} ;;
    relationship: many_to_one
  }
}

explore: privilege {
  join: resource {
    type: left_outer
    sql_on: ${privilege.resource_id} = ${resource.id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${privilege.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: permission {
    type: left_outer
    sql_on: ${privilege.permission_id} = ${permission.id} ;;
    relationship: many_to_one
  }
}

explore: project {}

explore: project_location {}

explore: quarters {
  join: pmo {
    type: left_outer
    sql_on: ${quarters.pmo_id} = ${pmo.id} ;;
    relationship: many_to_one
  }

  join: jira_business_unit {
    type: left_outer
    sql_on: ${pmo.jira_business_unit_id} = ${jira_business_unit.id} ;;
    relationship: many_to_one
  }
}

explore: request_criteria {
  join: allocation_role {
    type: left_outer
    sql_on: ${request_criteria.allocation_role_id} = ${allocation_role.id} ;;
    relationship: many_to_one
  }
}

explore: request_team {}

explore: resource {}

explore: role {}

explore: skill {}

explore: sync_flag {}

explore: sync_info {}

explore: team {
  join: allocation_role {
    type: left_outer
    sql_on: ${team.allocation_role_id} = ${allocation_role.id} ;;
    relationship: many_to_one
  }

  join: allocation_type {
    type: left_outer
    sql_on: ${team.allocation_type_id} = ${allocation_type.id} ;;
    relationship: many_to_one
  }

  join: employee {
    type: left_outer
    sql_on: ${team.employee_id} = ${employee.employee_id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${employee.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: hrms_business_unit {
    type: left_outer
    sql_on: ${employee.hrms_business_unit_id} = ${hrms_business_unit.id} ;;
    relationship: many_to_one
  }

  join: designation {
    type: left_outer
    sql_on: ${employee.designation_id} = ${designation.id} ;;
    relationship: many_to_one
  }
  join: project {
    type: left_outer
    sql_on: ${team.epic_id} = ${project.epic_id} ;;
    relationship: many_to_one
  }
}

explore: teammate {
  join: team {
    type: left_outer
    sql_on: ${teammate.team_id} = ${team.id} ;;
    relationship: many_to_one
  }

  join: allocation_role {
    type: left_outer
    sql_on: ${teammate.allocation_role_id} = ${allocation_role.id} ;;
    relationship: many_to_one
  }

  join: allocation_type {
    type: left_outer
    sql_on: ${teammate.allocation_type_id} = ${allocation_type.id} ;;
    relationship: many_to_one
  }

  join: employee {
    type: left_outer
    sql_on: ${teammate.employee_id} = ${employee.employee_id} ;;
    relationship: many_to_one
  }
  join: project {
    type: left_outer
    sql_on: ${project.epic_id} = ${team.epic_id} ;;
    relationship: many_to_one
  }
  join: role {
    type: left_outer
    sql_on: ${employee.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: hrms_business_unit {
    type: left_outer
    sql_on: ${employee.hrms_business_unit_id} = ${hrms_business_unit.id} ;;
    relationship: many_to_one
  }

  join: designation {
    type: left_outer
    sql_on: ${employee.designation_id} = ${designation.id} ;;
    relationship: many_to_one
  }
}

explore: timesheet_monthly_status {}

explore: tp_config {}

explore: worklog {
  join: employee {
    type: left_outer
    sql_on: ${worklog.employee_id} = ${employee.employee_id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${employee.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: hrms_business_unit {
    type: left_outer
    sql_on: ${employee.hrms_business_unit_id} = ${hrms_business_unit.id} ;;
    relationship: many_to_one
  }

  join: designation {
    type: left_outer
    sql_on: ${employee.designation_id} = ${designation.id} ;;
    relationship: many_to_one
  }
}

# Project Over Run Calculations

explore: worklog_details {
  join: worklog {
    type: left_outer
    sql_on: ${worklog_details.worklog_id} = ${worklog.id} ;;
    relationship: many_to_one
  }

  join: employee {
    type: left_outer
    sql_on: ${worklog.employee_id} = ${employee.employee_id} ;;
    relationship: many_to_one
  }

  join: role {
    type: left_outer
    sql_on: ${employee.role_id} = ${role.id} ;;
    relationship: many_to_one
  }

  join: hrms_business_unit {
    type: left_outer
    sql_on: ${employee.hrms_business_unit_id} = ${hrms_business_unit.id} ;;
    relationship: many_to_one
  }

  join: designation {
    type: left_outer
    sql_on: ${employee.designation_id} = ${designation.id} ;;
    relationship: many_to_one
  }
  join: project {
    type: left_outer
    sql_on: ${worklog_details.epic_id} = ${project.id} ;;
    relationship: many_to_one
  }
  join: bd {
    type: left_outer
    sql_on: ${project.jira_id} = ${bd.jira_id} ;;
    relationship: many_to_one
  }
  join: contracts {
    type: left_outer
    sql_on: ${project.jira_id} = ${contracts.jira_id} ;;
    relationship: many_to_one
  }
  join: pmo {
    type: left_outer
    sql_on: ${project.jira_id} = ${pmo.jira_id} ;;
    relationship: many_to_one
  }
}
