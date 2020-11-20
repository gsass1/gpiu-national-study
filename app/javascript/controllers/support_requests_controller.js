import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "customTypeInput" ]

  onSupportTypeChanged(e) {
    this.customTypeInputTarget.style.display = (e.target.value == "other_reason") ? "block" : "none"
  }
}
