const visObject = {
  id: "stats_widget",
  label: "Stats Widget",
  options: {},

  create: function (element, config) {
    this.container = element.appendChild(document.createElement("div"));
    this.container.setAttribute("id", "count-container");
    this.container.style.fontFamily = "Roboto,sans-serif";
    this.container.style.color = "#333";
    this.container.style.margin = "6px";
    this.container.style.padding = "16px 0 12px";
  },

  updateAsync: function (
    data,
    element,
    config,
    queryResponse,
    details,
    doneRendering
  ) {
    console.log("*************************************");
    console.log(data);
    console.log("*********************************************");
    console.log("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
    console.log(queryResponse);
    console.log("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
    const count = data[0]
      ? data[0][queryResponse?.fields?.measures[0]?.name]?.value ?? 0
      : 0;
    let display_label = queryResponse?.fields?.measures[0]?.name ?? "";
    }

   this.container.innerHTML = `<div style="display: flex;align-items: baseline; justify-content: space-between;">
  <div style="display: flex; align-items: baseline; justify-content: left;">
    <div style="height: 25px;
    width: 25px;
    background-color: blue;
    border-radius: 50%;
    display: inline-block;"></div>
    <div
    style="
    font-size: 56px;
    letter-spacing: -3px;
    margin-bottom: 0;
    margin-right: 4px;
    font-weight: 100;
    line-height: 1.1em;
    color: #333;
    display: flex;
    align-items: flex-end;
    "
    >
    ${count}
    </div
    style = "
    font-size: 56px;
    line-height: 8px;
    margin-bottom: 8px;
    color: black;
    font-weight: 900;
    "
    >
    ${display_label}
  </div>
</div>`;

    doneRendering();
  },
};

looker.plugins.visualizations.add(visObject);
