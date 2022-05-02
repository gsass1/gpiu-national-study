# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Questionnaire > SSI Questionnaire', js: true do
  include_context 'within study iteration'

  let(:user) { create(:user) }
  let(:patient) { create(:patient, creator: user, department: department, study_iteration: study_iteration) }

  before do
    # FIX: we should use FactoryBot here but we wanna just update the existing
    # PatientIdentification instead of creating a new one
    patient.patient_identification.update(
      birth_year: 2000,
      sex: :male,
      evidence_infection: false,
      infection_type: :ssi,
      admission_date: Date.today
    )

    # HACK! For some reason this state is not calculated correctly
    patient.update(identification_state: 'valid')

    sign_in(user)
    visit edit_patient_ssi_questionnaire_path(patient, patient.ssi_questionnaire)
  end

  it_behaves_like 'a questionnaire', name: 'SSI'
  it_behaves_like 'a UTI/SSI questionnaire', type: 'ssi'
end
