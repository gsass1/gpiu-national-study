# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Questionnaire > Prostate Biopsy Questionnaire', js: true do
  include_context 'within study iteration'

  let(:user) { create(:user) }
  let(:patient) do
    create(:patient, creator: user, department: department, study_iteration: study_iteration,
                     patient_type: :prostate_biopsy)
  end

  before do
    sign_in(user)
    visit edit_patient_biopsy_questionnaire_path(patient, patient.biopsy_questionnaire)
  end

  it_behaves_like 'a questionnaire', name: 'biopsy'

  describe 'section 1' do
    describe 'Antibiotics in preceding 6 months?' do
      it_behaves_like 'a yes/no/unknown form control',
                      input_selector: '.biopsy_questionnaire_antibiotics_preceding_months',
                      elem_selector: '#antibiotics_preceding_questions'
    end

    describe 'Urinary catheter duration' do
      it_behaves_like 'a yes/no/unknown form control',
                      input_selector: '.biopsy_questionnaire_urinary_catheter',
                      elem_selector: '#urinary_catheter_duration'
    end

    describe 'Prostate size' do
      it_behaves_like 'a yes/no/unknown form control',
                      input_selector: '.biopsy_questionnaire_prostate_size_measured',
                      elem_selector: '#prostate_size_measured'
    end
  end

  describe 'section 2' do
    describe 'PSA' do
      it_behaves_like 'a yes/no/unknown form control',
                      input_selector: '.biopsy_questionnaire_psa',
                      elem_selector: '#biopsy_questionnaire_psa_size'
    end

    describe 'Repeated biopsy' do
      it_behaves_like 'a yes/no/unknown form control',
                      input_selector: '.biopsy_questionnaire_repeated_biopsy',
                      elem_selector: '#biopsy_questionnaire_repeated_biopsy_number_previous_procedures'
    end
  end

  describe 'section 3' do
    describe 'Preoperative urine examination' do
      it_behaves_like 'a yes/no/unknown form control',
                      input_selector: '.biopsy_questionnaire_preoperative_urine_examination',
                      elem_selector: '#preoperative_urine_examination'

      context 'when Yes is chosen' do
        before do
          within '.biopsy_questionnaire_preoperative_urine_examination' do
            choose 'Yes'
          end
        end

        it_behaves_like 'a radio form control',
                        input_selector: '.biopsy_questionnaire_preoperative_urine_examination_type',
                        chosen_value: 'Culture',
                        elem_selector: '#preoperative_urine_examination_type'

        context 'When Culture is chosen' do
          before do
            within '.biopsy_questionnaire_preoperative_urine_examination_type' do
              choose 'Culture'
            end
          end

          it_behaves_like 'a radio form control',
                          input_selector: '.biopsy_questionnaire_preoperative_urine_culture_result',
                          chosen_value: 'Culture positive',
                          elem_selector: '#preoperative_urine_culture_result'
        end
      end
    end

    describe 'Preoperative bowel preparation' do
      it_behaves_like 'a yes/no/unknown form control',
                      input_selector: '.biopsy_questionnaire_preoperative_bowel_preparation',
                      elem_selector: '#preoperative_bowel_preparation'
    end

    describe 'Antibiotic prophylaxis' do
      it_behaves_like 'a yes/no/unknown form control',
                      input_selector: '.biopsy_questionnaire_antibiotic_prophylaxis',
                      elem_selector: '#antibiotic_prophylaxis_preceding_questions'
    end

    describe 'Anesthesia' do
      it_behaves_like 'a yes/no/unknown form control',
                      input_selector: '.biopsy_questionnaire_biopsy_anesthesia',
                      elem_selector: '#biopsy_anesthesia'
    end
  end
end
