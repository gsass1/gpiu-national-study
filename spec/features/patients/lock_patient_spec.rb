# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Patients > Lock patient' do
  include_context 'within study iteration'

  let!(:user) { create(:user) }
  let!(:patient) { create(:patient, study_iteration: study_iteration, creator: user, department: department, patient_type: :uti_ssi) }

  before do
    sign_in(user)
  end

  context 'when the user has an unlocked patient' do
    before do
      visit patients_path
    end

    it 'can lock the patient' do
      find(:css, "a#lock-patient-#{patient.id}").click

      expect(page).to have_content('Locked patient')
      expect(Patient.last).to be_locked
    end
  end

  context 'when the user has a locked patient' do
    before do
      patient.update(locked: true)
      visit patients_path
    end

    it 'can unlock the patient' do
      find(:css, "a#unlock-patient-#{patient.id}").click

      expect(page).to have_content('Unlocked patient')
      expect(Patient.last).to_not be_locked
    end
  end
end
