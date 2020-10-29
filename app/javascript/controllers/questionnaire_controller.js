import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    document.querySelectorAll('[data-condition').forEach((elem) => {
      this.onTriggerChange({ target: elem  });
    }, this);
  }

  onTriggerChange(e) {
    const elem = document.getElementById(e.target.getAttribute('data-elem'));

    if (elem == null) return;

    const cond = e.target.getAttribute('data-condition');

    let conditionMatched = false;
    if (e.target.type == "radio") {
      conditionMatched = (e.target.value == cond) && e.target.checked;

      if (cond.includes(",")) {
        conditionMatched = cond.split(",").includes(e.target.value) && e.target.checked;
      } else {
        conditionMatched = (e.target.value == cond) && e.target.checked;
      }
    } else if (e.target.type == "checkbox") {
      conditionMatched = e.target.checked == (cond == "true");
    } else {
      if (cond.includes(",")) {
        conditionMatched = cond.split(",").includes(e.target.value);
      } else {
        conditionMatched = e.target.value == cond;
      }
    }

    if (conditionMatched) {
      if (elem instanceof HTMLLIElement) {
        elem.style.display = "list-item";
      } else {
        elem.style.display = "block";
      }
    } else {
      elem.style.display = "none";
    }
  }
}
