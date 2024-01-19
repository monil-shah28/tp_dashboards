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
      data.map((data,index) => {
        console.log(index)
    const count = data[index]
      ? data[index][queryResponse?.fields?.measures[index]?.name]?.value ?? 0
      : 0;
    let display_label = queryResponse?.fields?.measures[index]?.name ?? "";

   this.container.innerHTML = `<div
  style="display: flex; align-items: baseline; justify-content: space-between"
>
  <div style="display: flex; align-items: baseline; justify-content: left">
    <div
      style="
        height: 15px;
        width: 15px;
        background-color: blue;
        border-radius: 50%;
        display: inline-block;
        justify-content: space-between;
      "
    ></div>

    <div
      style="
        font-size: 30px;
        letter-spacing: -3px;
        margin-bottom: 0;
        margin-right: 4px;
        font-weight: 100;
        line-height: 30px;
        color: black;
        display: flex;
        align-items: flex-end;
        justify-content: space-between;
      "
    >
      ${count}
    </div>

    <div
      style="
        font-size: 30px;
        letter-spacing: -3px;
        margin-bottom: 0;
        margin-right: 4px;
        line-height: 30px;
        color: black;
        display: flex;
        align-items: flex-end;
        justify-content: space-between;
      "
    >
      ${display_label}
    </div>
  </div>
</div>
`;
});
    doneRendering();
  },
};

looker.plugins.visualizations.add(visObject);
