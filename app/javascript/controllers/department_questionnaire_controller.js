import { Controller } from "stimulus";

export default class extends Controller {
  onAntimicrobialOppositeChanged(e) {
    // Switch between "not relevant for our department" and "not routinely" as well as disable all "yes" options
    const group = e.target.getAttribute('data-antimicrobial-group');
    const opposite = e.target.getAttribute('data-antimicrobial-opposite');
    if (e.target.checked) {
      document.querySelector(`[name='department_questionnaire[b_${group}_${opposite}]'`).checked = false;

      for(let i = 1; i <= 16; ++i) {
        document.querySelectorAll(`[name='department_questionnaire[b_${group}_${i}]'`).forEach((elem) => {
          elem.checked = false;
        });
      }
    }
  }

  onAntimicrobialControlledByChanged(e) {
    const group = e.target.getAttribute('data-antimicrobial-controlled-by');

    if (e.target.checked) {
      document.querySelector(`[name='department_questionnaire[b_${group}_99]'`).checked = false;
      document.querySelector(`[name='department_questionnaire[b_${group}_0]'`).checked = false;
    }
  }
}
