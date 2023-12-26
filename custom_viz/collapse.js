const visObject = {

  create: function(element, config){
        this.container = element.appendChild(document.createElement('div'));
        this.container.style.width = "100%";
        this.container.style.height = "100%";
  },

  updateAsync: function(data, element, config, queryResponse, details, doneRendering){

        this.container.innerHTML = '';
        const outputData = {
            name: "root",
            children: []
        };

        const input_data = [...new Set(data.map(item => item[queryResponse.fields.dimension_like[0].name].value))];

        input_data.forEach(dataId => {
            const input_unit_data = {
                name: dataId.toString(),
                children: []
            };

            const dimensions = data.filter(item => item[queryResponse.fields.dimension_like[0].name].value === dataId);

            dimensions.forEach(main => {
                const dimensions_data = {
                    name: main[queryResponse.fields.dimension_like[1].name].value,
                    children: [{ name: main[queryResponse.fields.dimension_like[2].name] }]
                };

                const mainId = main[queryResponse.fields.dimension_like[3].name].value;
                const mainNode = input_unit_data.children.find(node => node.name === mainId);

                if (mainNode) {
                    mainNode.children.push(dimensions_data);
                } else {
                    input_unit_data.children.push({
                        name: mainId,
                        children: [dimensions_data]
                    });
                }
            });

            outputData.children.push(input_unit_data);
        });

        data = outputData;

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

        const root = d3.hierarchy(data);
        root.x0 = height / 2;
        root.y0 = width / 2;
        root.children.forEach(collapse);

        function collapse(d) {
          if (d.children) {
            d._children = d.children;
            d._children.forEach(collapse);
            d.children = null;
          } else if (d._children) {
            d.children = d._children;
            d.children.forEach(collapse);
            d._children = null;
          }
        }

        update(root);

        function update(source) {
          const treeData = tree(root);
          const nodes = treeData.descendants();
          const links = treeData.descendants().slice(1);

          nodes.forEach(d => {
              d.y = d.depth * 180;
          });

          const node = svg.selectAll("g.node")
            .data(nodes, d => d.id || (d.id = ++i));

          const nodeEnter = node.enter().append("g")
            .attr("class", "node")
            .attr("transform", d => `translate(${source.y0},${source.x0})`)
            .on("click", nodeclick)
            .attr("cursor", "pointer")
            .attr("pointer-events", "all");

          nodeEnter.append("circle")
            .attr("r", 1e-6)
            .attr("fill", "black");

          nodeEnter.append("text")
          .attr("fill", "black")
          .attr("dy", d => d.parent ? "1em" : "-1em")
          .attr("text-anchor", d => d.parent ? "end" : "start")
          .attr("x", d => d.parent ? -10 : 10)
          .text(d => d.data.name);

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

          const link = svg.selectAll("path.link").data(links, d => d.id);

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
