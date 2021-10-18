require 'rails_helper'

RSpec.describe 'Questionnaire > Prostate Biopsy Outcome Questionnaire', js: true do
  include_context 'within study iteration'

  let(:user) { create(:user) }
  let(:patient) { create(:patient, creator: user, department: department, study_iteration: study_iteration, patient_type: :prostate_biopsy) }

  before do
    sign_in(user)
    visit edit_patient_biopsy_outcome_questionnaire_path(patient, patient.biopsy_outcome_questionnaire)
  end

  it_behaves_like 'a questionnaire', name: 'Biopsy Outcome'

  describe 'section 1' do
    describe 'Histopathology analysis' do
      it_behaves_like 'a yes/no/unknown form control',
        input_selector: '.biopsy_outcome_questionnaire_histopathology_analysis',
        elem_selector: '#histopathology_analysis'

      context 'when Yes chosen' do
        before do
          within '.biopsy_outcome_questionnaire_histopathology_analysis' do
            choose 'Yes'
          end
        end

        it_behaves_like 'a yes/no/unknown form control',
          input_selector: '.biopsy_outcome_questionnaire_histopathology_biopsy_material_change',
          elem_selector: '#histopathology_biopsy_material_change'
      end
    end

    describe 'Outcome analysis performed' do
      it_behaves_like 'a yes/no/unknown form control',
        input_selector: '.biopsy_outcome_questionnaire_outcome_analysis',
        elem_selector: '#outcome_analysis'
    end

    describe 'Symptoms of urinary tract infection' do
      it_behaves_like 'a yes/no/unknown form control',
        input_selector: '.biopsy_outcome_questionnaire_outcome_analysis_urinary_tract_infection',
        elem_selector: '#outcome_analysis_urinary_tract_infection'
    end

    describe 'Physician visit' do
      it_behaves_like 'a yes/no/unknown form control',
        input_selector: '.biopsy_outcome_questionnaire_physician_visit',
        elem_selector: '#physician_visit'

      context 'when Yes is chosen' do
        before do
          within '.biopsy_outcome_questionnaire_physician_visit' do
            choose 'Yes'
          end
        end

        it_behaves_like 'a yes/no/unknown form control',
          input_selector: '.biopsy_outcome_questionnaire_physician_visit_admission_hospital',
          elem_selector: '#physician_visit_admission_hospital'

        it_behaves_like 'a yes/no/unknown form control',
          input_selector: '.biopsy_outcome_questionnaire_physician_visit_psa',
          elem_selector: '#physician_visit_psa'

        it_behaves_like 'a yes/no/unknown form control',
          input_selector: '.biopsy_outcome_questionnaire_physician_visit_wbc_count',
          elem_selector: '#physician_visit_wbc_count'

        it_behaves_like 'a yes/no/unknown form control',
          input_selector: '.biopsy_outcome_questionnaire_physician_visit_urine_culture',
          elem_selector: '#physician_visit_urine_culture'
      end
    end

    describe 'Antibiotic treatment' do
      it_behaves_like 'a yes/no/unknown form control',
        input_selector: '.biopsy_outcome_questionnaire_antibiotic_treatment',
        elem_selector: '#biopsy_outcome_questionnaire_antibiotics_type'
    end
  end
end
