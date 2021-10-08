import { Controller } from "stimulus"
import toastr from 'toastr'

export default class extends Controller {
  connect() {
    document.querySelectorAll(".toast-message").forEach((elem) => {
      let type = elem.getAttribute('toast-type')
      const message = elem.getAttribute('toast-message')

      toastr.options.positionClass = 'toast-top-right'
      toastr.options.progressBar = true
      toastr.options.fadeIn = 250

      switch(type) {
        case 'alert':
        case 'danger':
          toastr.error(message)
          break;
        case 'notice':
          toastr.info(message)
          break;
        case 'success':
          toastr.success(message)
          break;
      }
    }, this)
  }
}
