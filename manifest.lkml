project_name: "tp"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

visualization: {
  id: "collapse"
  label: "Collapse"
  file: "custom_viz/collapse.js"
  dependencies: [
    "https://code.jquery.com/jquery-2.2.4.min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.9.1/underscore-min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.6/d3.min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/d3-legend/1.13.0/d3-legend.min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/d3/7.8.5/d3.min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/d3/7.8.5/d3.js",
    "https://d3js.org/d3.v7.min.js"
  ]
}
