connection: "team_planner"

# Include all views which is in databse
include: "/views/*.view.lkml"
include: "/dashboards/*.dashboard"

explore: poc {
  from: employee
  # sql_always_where: CAST(split_part('{{_user_attributes['org_key']}}', '-', 1) AS INTEGER)  = ${poc.id}
  # ;;
}
explore: poc1 {
  from: employee
}
