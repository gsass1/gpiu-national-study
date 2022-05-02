import { Controller } from 'stimulus'
import toastr from 'toastr'

export default class extends Controller {
  connect() {
    this.element.querySelectorAll('.toast-message').forEach((elem) => {
      const type = elem.getAttribute('toast-type')
      const message = elem.getAttribute('toast-message')

      toastr.options.positionClass = 'toast-top-right'
      toastr.options.progressBar = true
      toastr.options.fadeIn = 250

      switch (type) {
        case 'alert':
        case 'danger':
          toastr.error(message)
          break
        case 'notice':
          toastr.info(message)
          break
        case 'success':
          toastr.success(message)
          break
        default:
          break
      }

      elem.remove()
    }, this)

    document.addEventListener('turbolinks:before-cache', this.removeCachedContainer)
  }

  disconnect() {
    document.removeEventListener('turbolinks:before-cache', this.removeCachedContainer)
  }

  removeCachedContainer() {
    const container = document.getElementById('toast-container').remove()

    if(container) {
      container.remove()
    }
  }
}
