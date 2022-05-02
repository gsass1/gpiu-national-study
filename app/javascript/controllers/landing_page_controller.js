import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['navbar', 'content', 'participation', 'countries', 'welcome']

  connect() {
    document.addEventListener('scroll', () => {
      const navbarHeight = 100
      const navbarBg = 'bg-primary'
      if (window.scrollY >= navbarHeight) {
        if(!this.navbarTarget.classList.contains(navbarBg)) {
          this.navbarTarget.classList.add(navbarBg)
        }
      } else {
        this.navbarTarget.classList.remove(navbarBg)
      }
    })
  }

  scrollToTop() {
    this.welcomeTarget.scrollIntoView({
      left: 0,
      block: 'start',
      behavior: 'smooth'
    })
  }

  scrollToContent() {
    this.contentTarget.scrollIntoView({
      left: 0,
      block: 'start',
      behavior: 'smooth'
    })
  }

  scrollToParticipation() {
    this.participationTarget.scrollIntoView({
      left: 0,
      block: 'start',
      behavior: 'smooth'
    })
  }

  scrollToCountries(e) {
    e.preventDefault()
    this.countriesTarget.scrollIntoView({
      left: 0,
      top: 200,
      block: 'start',
      behavior: 'smooth'
    })
  }
}
