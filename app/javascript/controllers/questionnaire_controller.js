import { Controller } from "stimulus"

export default class extends Controller {
  onTriggerChange(e) {
    const elem = document.getElementById(e.target.getAttribute('data-elem'));
    if (e.target.value == e.target.getAttribute('data-condition')) {
      elem.style.display = "list-item"
    } else {
      elem.style.display = "none"
    }
  }
}
