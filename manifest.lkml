project_name: "tp"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

visualization: {
  id: "stats_count"
  label: "stats widget"
  file: "custom_viz/stats_widget.js"
}

visualization: {
  id: "sunburst_viz"
  label: "sunburst_viz"
  file: "custom_viz/sunburst.js"
  dependencies: [
    "https://code.jquery.com/jquery-2.2.4.min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.9.1/underscore-min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/d3/4.13.0/d3.js",
  ]
}
