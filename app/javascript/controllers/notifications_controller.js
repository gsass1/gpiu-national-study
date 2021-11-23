import { Controller } from 'stimulus'
import { get } from '@rails/request.js'

export default class extends Controller {
  static targets = [ "dropdown" ]

  async load() {
    const elem = this.dropdownTarget
    if (elem.innerHTML !== "") return

    /* Loading */
    elem.innerHTML = "<div class='text-center'><div class='spinner-border'></div></div>"

    /* Load dropdown content */
    const response = await get('/notifications?dropdown=1')
    if (response.ok) {
      const html = await response.html
      elem.innerHTML = html
    }
  }
}
