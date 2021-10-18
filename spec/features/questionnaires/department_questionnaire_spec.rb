require 'rails_helper'

RSpec.describe 'Patients > Department questionnaire' do
  include_context 'within study iteration'

  let(:user) { create(:user) }

  before do
    sign_in(user)
    visit edit_hospital_department_department_questionnaire_path(hospital.id, department.id, department.current_department_questionnaire.id)
  end

  describe 'questionnaire' do
    it 'can be saved' do
      click_button 'Submit'
      expect(page).to have_content('Questionnaire successfully saved')
    end
  end

  describe 'section 2' do
    describe 'Other type of hospital' do
      context 'when Other hospital is chosen' do
        before do
          within '.department_questionnaire_hospital_type' do
            choose 'Other hospital (please specify)'
          end
        end

        it 'allows the user to enter the hospital type' do
          expect(page).to have_selector('.department_questionnaire_hospital_othertype')
        end
      end

      context 'when Other type is not chosen' do
        it 'hides the hospital type' do
          expect(page).not_to have_selector('.department_questionnaire_hospital_othertype')
        end
      end
    end
  end
end
