connection: "tp"

# Include all views which is in databse
include: "/views/*.view.lkml"

explore: poc {
  from: employee
  sql_always_where: ${poc.date_of_joining_date} < ${poc.time_poc_dimension} ;;
}
explore: poc1 {
  from: employee
}
