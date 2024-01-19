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
    const count = data[0]
      ? data[0][queryResponse?.fields?.measures[0]?.name]?.value ?? 0
      : 0;
    let display_label = queryResponse?.fields?.measures[0]?.name ?? "";
    const parts = display_label.split("_");

    display_label = parts[0];
    const indicator_count = data[0]
      ? data[0]["indicator_count"]?.value ?? 0
      : 0;

    let formatted_count = Number(count);
    const suffixes = ["", "K", "M", "B", "T"];
    let suffixNum = 0;
    while (formatted_count >= 1000) {
      formatted_count /= 1000;
      suffixNum += 1;
    }
    if (suffixes[suffixNum]) {
      formatted_count = formatted_count.toPrecision(3);
    }

    formatted_count += suffixes[suffixNum];
    let content = "";

    if (indicator_count) {
      const actual_count = Number(indicator_count);
      const abs_count = Math.abs(indicator_count);
      let formatted_ind_count = actual_count;
      const suffixes = ["", "K", "M", "B", "T"];
      let suffixNum = 0;
      while (formatted_ind_count >= 1000) {
        formatted_ind_count /= 1000;
        suffixNum += 1;
      }
      if (suffixes[suffixNum]) {
        formatted_ind_count = formatted_ind_count.toPrecision(3);
      }

      formatted_ind_count += suffixes[suffixNum];
      content =
        actual_count > 0
          ? `<span style="font-size: 16px;
        margin-top: 5.5px;
        margin-left: 0;
        letter-spacing: -1px;
        color: #228b22;
        white-space: nowrap;">▲ ${formatted_ind_count}</span>`
          : `<span style="font-size: 16px;
        margin-top: 5.5px;
        margin-left: 0;
        letter-spacing: -1px;
        color: #7C0A02;
        white-space: nowrap;">▼ ${formatted_ind_count}</span>`;
    }

    this.container.innerHTML = `<div style="display: flex; align-items: baseline; justify-content: center">
      <div style="font-size: 56px; letter-spacing: -3px; margin-bottom: 0; margin-right: 4px; font-weight: 100; line-height: 1.1em; color: #333; display: flex; align-items: flex-end;">${formatted_count}</div>
      ${content}
      </div>
      <div style="display: flex; align-items: baseline; justify-content: center">
        <div style="font-size: 16px;
        line-height: 8px;
        margin-bottom: 8px;
        margin-top: 4px;
        text-transform: uppercase;
        color: #999;
        font-weight: 900;
        letter-spacing: .5px; ">${display_label}</div>
      </div>`;

    doneRendering();
  },
};

looker.plugins.visualizations.add(visObject);
