import { Controller } from 'stimulus';

const COOKIE_NAME = 'cookies_accepted'

export default class extends Controller {
  connect() {
    if (!this.hasAccepted()) {
      this.element.style.display = 'block'
    }
  }

  hasAccepted() {
    const cookie = document.cookie
      .split('; ')
      .find(row => row.startsWith(`${COOKIE_NAME}=true`))
    return !!cookie
  }

  accept() {
    document.cookie = `${COOKIE_NAME}=true;`
    this.element.style.display = 'none'
  }
}
