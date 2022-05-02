/* eslint class-methods-use-this: "off" */

import { Controller } from 'stimulus'

const LEAVE_MESSAGE = 'You are attempting to leave this page. However if you have not clicked Submit then all changes you have made will be lost. Are you sure you want to leave this page?'

export default class extends Controller {
  connect() {
    this.element.querySelectorAll("form[questionnaire_locked='true'").forEach((elem) => {
      this.disableForm(elem);
    }, this);

    this.element.querySelectorAll('[data-condition').forEach((elem) => {
      this.onTriggerChange({ target: elem, first: true });
    }, this);

    this.element.querySelectorAll('input').forEach((input) => {
      if(input.type == 'submit') {
        input.addEventListener('click', this.allowSubmission.bind(this))
      } else {
        input.addEventListener('change', this.onInputChange.bind(this))
      }
    })

    this.onPageLeave = this.onPageLeave.bind(this)

    window.addEventListener('turbolinks:before-visit', this.onPageLeave)
    window.addEventListener('beforeunload', this.onPageLeave)
  }

  disconnect() {
    window.removeEventListener('turbolinks:before-visit', this.onPageLeave)
    window.removeEventListener('beforeunload', this.onPageLeave)
  }

  allowSubmission() {
    this.setChanged(false)
  }

  onInputChange() {
    this.setChanged(true)
  }

  onPageLeave(e) {
    if(this.hasFormBeenChanged()) {
      if(e.type == 'turbolinks:before-visit') {
        if (!window.confirm(LEAVE_MESSAGE)) {
          e.preventDefault()
        }
      } else {
        e.returnValue = LEAVE_MESSAGE
        return event.returnValue
      }
    }
  }

  setChanged(changed) {
    this.data.set('changed', changed)
  }

  hasFormBeenChanged() {
    return this.data.get('changed') == 'true'
  }

  onTriggerChange(e) {
    const elem = document.getElementById(e.target.getAttribute('data-elem'));

    if (elem == null) return;

    const cond = e.target.getAttribute('data-condition');

    let conditionMatched = false;
    if (e.target.type === 'radio') {
      conditionMatched = (e.target.value === cond) && e.target.checked;

      if (cond.includes(',')) {
        conditionMatched = cond.split(',').includes(e.target.value) && e.target.checked;
      } else {
        conditionMatched = (e.target.value === cond) && e.target.checked;
      }
    } else if (e.target.type === 'checkbox') {
      conditionMatched = e.target.checked === (cond === 'true');
    } else if (cond.includes(',')) {
      conditionMatched = cond.split(',').includes(e.target.value);
    } else {
      conditionMatched = e.target.value === cond;
    }

    if (conditionMatched) {
      if (elem instanceof HTMLLIElement) {
        elem.style.display = 'list-item';
      } else {
        elem.style.display = 'block';
      }
    } else if (e.first) {
      if (elem.style.display !== 'block' && elem.style.display !== 'list-item') {
        elem.style.display = 'none';
      }
    } else {
      elem.style.display = 'none';
    }
  }

  disableForm(form) {
    form.querySelectorAll('input, select, textarea').forEach((elem) => {
      elem.setAttribute('disabled', true);
    });
  }
}
