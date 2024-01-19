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
    this.container.style.display = "flex";
    this.container.style.justifyContent = "space-between"
    this.container.style.width = "200px";
    this.container.style.height = "10px";
  },

  updateAsync: function (
    data,
    element,
    config,
    queryResponse,
    details,
    doneRendering
  ) {
     this.container.innerHTML=``;
    queryResponse?.fields?.measures.forEach((key, index) => {
      const count = data[0] ? data[0][key.name]?.value ?? 0 : 0;

      let display_label = key?.name ?? "";

      const childEle = this.container.appendChild(
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
        background-color: blue;
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
