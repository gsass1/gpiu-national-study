# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Questionnaire > Unsaved Changes Hint' do
  include_context 'within study iteration'

  let(:user) { create(:user) }
  let(:patient) { create(:patient, creator: user, department: department, study_iteration: study_iteration) }

  before do
    sign_in(user)
    visit edit_patient_identification_path(patient, patient.patient_identification)
  end

  context 'when a change is made' do
    before do
      select '1987', from: :patient_identification_birth_year
      choose 'Female'
      choose 'SSI'
    end

    it 'displays a warning if back button is clicked' do
      msg = accept_confirm do
        find('.back-button').click
      end

      expect(msg).to eq('You are attempting to leave this page. However if you have not clicked Submit then all changes you have made will be lost. Are you sure you want to leave this page?')
    end

    it 'does not display a warning if form submitted' do
      click_button 'Submit'
    end
  end
end
