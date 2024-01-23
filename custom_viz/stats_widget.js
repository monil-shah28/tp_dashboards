const visObject = {
  id: "stats_widget",
  label: "Stats Widget",
  options: {},

  create: function (element, config) {
    this.container = element.appendChild(document.createElement("div"));
    this.container.setAttribute("id", "count-container");
    this.container.style.fontFamily = "Roboto,sans-serif";
    const title = this.container.appendChild(document.createElement("div"));
    title.innerHTML = `<p>Total Appomni Insights Resolved</p>`;
    this.content = this.container.appendChild(document.createElement("div"));
    this.content.style.color = "#333";
    this.content.style.margin = "6px";
    this.content.style.padding = "16px 0 12px";
    this.content.style.display = "flex";
    this.content.style.justifyContent = "space-between";
  },

  updateAsync: function (
    data,
    element,
    config,
    queryResponse,
    details,
    doneRendering
  ) {
     this.content.innerHTML=``;
     var colorArray = ['#FF6633', '#FFB399', '#FF33FF', '#FFFF99', '#00B3E6']
    queryResponse?.fields?.measures.forEach((key, index) => {
      const count = data[0] ? data[0][key.name]?.value ?? 0 : 0;

      let display_label = key?.label ?? "";

      const childEle = this.content.appendChild(
        document.createElement("div")
      );
      childEle.style.fontFamily = "Roboto,sans-serif";
      childEle.style.display = "flex";
      childEle.style.alignItems = "center";

      childEle.innerHTML = `
      <div
      style="
        height: 15px;
        width: 15px;
        background-color: ${colorArray[index]};
        border-radius: 50%;
      "
    ></div>
    <div
      style="
        font-size: 24px;
        margin: 0 4px 0 4px;
        font-weight: 100;
        line-height: 30px;
        color: black;
      "
    >
      ${count}
    </div>
    <div
      style="
        font-size: 20px;
        margin-right: 4px;
        line-height: 30px;
        color: black;
      "
    >
      ${display_label}
    </div>
  `;
    });
    doneRendering();
  },
};

looker.plugins.visualizations.add(visObject);
