# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Patients > Lock patient' do
  include_context 'within study iteration'

  let!(:user) { create(:user) }
  let!(:patient) do
    create(:patient, study_iteration: study_iteration, creator: user, department: department, patient_type: :uti_ssi)
  end

  before do
    sign_in(user)
  end

  context 'when the user has an unlocked patient' do
    context 'when patient questionnaires have been filled out completely' do
      before do
        # Force update patient to be valid
        patient.update(identification_state: :valid,
                       uti_state: :valid,
                       ssi_state: :valid)
      end

      it 'can lock the patient' do
        visit patients_path
        find(:css, "a#lock-patient-#{patient.id}").click

        expect(page).to have_content('Locked patient')
        expect(patient.reload).to be_locked
      end
    end

    context 'when patient is not valid completely' do
      it 'cannot unlock the patient' do
        visit patients_path
        expect(page).not_to have_selector(:css, "a#lock-patient-#{patient.id}")
      end
    end
  end

  context 'when the user has a locked patient' do
    before do
      patient.update(locked: true,
                     identification_state: :valid,
                     uti_state: :valid,
                     ssi_state: :valid)
      visit patients_path
    end

    it 'can unlock the patient' do
      find(:css, "a#unlock-patient-#{patient.id}").click

      expect(page).to have_content('Unlocked patient')
      expect(Patient.last).not_to be_locked
    end
  end
end
