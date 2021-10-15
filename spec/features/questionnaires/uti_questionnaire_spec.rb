require 'rails_helper'

RSpec.describe 'Questionnaire > UTI Questionnaire', js: true do
  include_context 'within study iteration'

  let(:user) { create(:user) }
  let(:patient) { create(:patient, creator: user, department: department, study_iteration: study_iteration) }

  before do
    sign_in(user)
    visit edit_patient_uti_questionnaire_path(patient, patient.uti_questionnaire)
  end

  it_behaves_like 'a questionnaire', name: 'UTI'

  describe 'section 2' do
    describe 'Urinary tract obstruction' do
      it_behaves_like 'a yes/no form control',
        input_selector: '.uti_questionnaire_tractobstruction',
        elem_selector: '#tractobstruction_question'
    end

    describe 'Antibiotic treatment' do
      it_behaves_like 'a yes/no form control',
        input_selector: '.uti_questionnaire_treatment',
        elem_selector: '#treatment_questions'
    end
  end

  describe 'section 5' do
    describe 'Is the patient considered to have a microbiologically proven UTI?' do
      it_behaves_like 'a yes/no form control',
        input_selector: '.uti_questionnaire_provennauti',
        elem_selector: '#provennauti_questions'

      context 'when yes and Other is chosen' do
        before do
          within '.uti_questionnaire_provennauti' do
            choose 'Yes'
          end
        end

      it_behaves_like 'a checkbox form control',
        input_selector: '#provennauti_questions',
        checkbox: 'Other',
        elem_selector: '#uti_questionnaire_culturetissue_specify'
      end
    end

    describe 'Was the patient receiving antibiotics when culture was taken?' do
      it_behaves_like 'a yes/no/unknown form control',
        input_selector: '.uti_questionnaire_antibioticculture',
        elem_selector: '#antibioticculture_questions'
    end
  end

  describe 'section 6' do
    shared_examples 'shows antimicrobial drugs' do |option:,show:|
      it do
        within '.uti_questionnaire_antimicrobial_treatment' do
          choose option
        end

        if show
          expect(page).to have_selector(:css, '#treatment_antibiotics')
        else
          expect(page).not_to have_selector(:css, '#treatment_antibiotics')
        end
      end
    end

    describe 'Administration of antimicrobial treatment' do
      it_behaves_like 'shows antimicrobial drugs', option: 'No treatment', show: false
      it_behaves_like 'shows antimicrobial drugs', option: 'Oral', show: true
      it_behaves_like 'shows antimicrobial drugs', option: 'Parenteral', show: true
      it_behaves_like 'shows antimicrobial drugs', option: 'Both', show: true
    end
  end
end

