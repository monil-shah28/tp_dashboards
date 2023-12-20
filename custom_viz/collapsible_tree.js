const visObject = {

  create: function(element, config){
        this.container = element.appendChild(document.createElement('div'));
        this.container.style.width = "100%";
        this.container.style.height = "100%";
  },

  updateAsync: function(data, element, config, queryResponse, details, doneRendering){

        const outputData = {
            name: "root",
            children: []
        };

        const uniqueBusinessUnits = [...new Set(data.map(item => item["hrms_business_unit.id"].value))];

        uniqueBusinessUnits.forEach(businessUnitId => {
            const businessUnitData = {
                name: businessUnitId.toString(),
                children: []
            };

            const employees = data.filter(item => item["hrms_business_unit.id"].value === businessUnitId);

            employees.forEach(employee => {
                const employeeData = {
                    name: employee["employee.employee_name"].value,
                    children: [{ name: employee["employee.employee_id"].value.toString() }]
                };

                const managerId = employee["employee.direct_manager_id"].value;
                const managerNode = businessUnitData.children.find(node => node.name === managerId.toString());

                if (managerNode) {
                    managerNode.children.push(employeeData);
                } else {
                    businessUnitData.children.push({
                        name: managerId.toString(),
                        children: [employeeData]
                    });
                }
            });

            outputData.children.push(businessUnitData);
        });
        JSON.stringify(outputData, null, 4);

        const margin = { top: 20, right: 90, bottom: 30, left: 90 };
        const width = 960;
        const height = 450;

        const duration = 750;
        let i = 0;
        const tree = d3.tree().size([height, width]);

        const svg = d3.select(this.container).append("svg")
                    .attr("width", width + margin.right + margin.left)
                    .attr("height", height + margin.top + margin.bottom)
                    .append("g")
                    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

        const root = d3.hierarchy(outputData);
        root.x0 = height / 2;
        root.y0 = width / 2;
        root.children.forEach(collapse);

        function collapse(d) {
          if (d.children) {
            d._children = d.children;
            d.children = null;
          } else {
            d.children = d._children;
            d.children = null;
          }
        }

        update(root);

        function update(source) {
          const treeData = tree(root);
          const nodes = treeData.descendants();
          const links = treeData.descendants().slice(1);

          nodes.forEach(d => {
              d.y = d.depth * 200;
              d.x0 = d.x;
              d.y0 = d.y;
          });

          const node = svg.selectAll("g.node")
            .outputData(nodes, d => d.id || (d.id = ++i));

          const nodeEnter = node.enter().append("g")
            .attr("class", "node")
            .attr("transform", d => `translate(${source.y0},${source.x0})`)
            .on("click", nodeclick)
            .attr("cursor", "pointer")
            .attr("pointer-events", "all");

          nodeEnter.attr("class", "node")
            .attr("r", 1e-6)
            .attr("fill", "black");

          nodeEnter.append("circle")
            .attr("fill", "black");

          nodeEnter.append("text")
          .attr("fill", "black")
          .attr("dy", d => d.parent ? "1em" : "-1em")
          .attr("text-anchor", d => d.parent ? "end" : "start")
          .attr("x", d => d.parent ? -10 : 10)
          .text(d => d.outputData.name);

          const nodeUpdate = node.merge(nodeEnter).transition().duration(duration)
            .attr("transform", d => `translate(${d.y},${d.x})`);

          nodeUpdate.select("circle")
            .attr("r", 5);

          nodeUpdate.select("text")
            .attr("fill-opacity", 1);

          const nodeExit = node.exit().transition().duration(duration)
            .attr("transform", d => `translate(${source.y},${source.x})`)
            .remove();

          nodeExit.select("circle").attr("opacity", 1e-6);

          const link = svg.selectAll("path.link").outputData(links, d => d.id);

          const linkEnter = link.enter().insert("path", "g")
            .attr("class", "link")
            .attr("d", d => {
              const o = { x: source.x0, y: source.y0 };
              return diagonal(o, o);
            })
            .attr("fill", "none")
            .attr("stroke", "#ccc")
            .attr("stroke-width", 2);

          const linkUpdate = linkEnter.merge(link);

          linkUpdate.transition()
            .duration(duration)
            .attr("d", function(d) {
              return diagonal(d, d.parent);
            });

          function diagonal(s, d) {
            const path = `M ${s.y} ${s.x}
                    C ${(s.y + d.y) / 2} ${s.x},
                      ${(s.y + d.y) / 2} ${d.x},
                      ${d.y} ${d.x}`;

            return path;
          }

          function nodeclick(d) {
            if (d.children) {
              d._children = d.children;
              d.children = null;
            } else {
              d.children = d._children;
              d._children = null;
            }
            update(d);
          }
        }

      doneRendering()
  }
};

looker.plugins.visualizations.add(visObject);
