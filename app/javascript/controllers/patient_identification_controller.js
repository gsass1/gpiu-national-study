import { Controller } from "stimulus"

// TODO(gian): what about making a generic controller for questionnaires?
export default class extends Controller {
  static targets = [ "pregnancyInput", "evidenceInfectionInput", "admissionInfectionInput" ]

  connect() {
    this.onSexSelection()
    this.onEvidenceInfectionSelected()
  }

  onSexSelection() {
    // NOTE(gian): Ideally we could bind the input to a target but since simple
    // form creates the two radio buttons for us automatically we have to use
    // the raw ID to check the radio buttons
    const isFemale = document.getElementById("patient_identification_sex_female").checked
    this.pregnancyInputTarget.style.display = isFemale ? "block" : "none"
  }

  onEvidenceInfectionSelected() {
    this.admissionInfectionInputTarget.style.display = this.evidenceInfectionInputTarget.checked ? "block" : "none"
  }
}
