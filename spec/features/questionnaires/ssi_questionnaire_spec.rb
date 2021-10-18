require 'rails_helper'

RSpec.describe 'Questionnaire > SSI Questionnaire', js: true do
  include_context 'within study iteration'

  let(:user) { create(:user) }
  let(:patient) { create(:patient, creator: user, department: department, study_iteration: study_iteration) }

  before do
    sign_in(user)
    visit edit_patient_ssi_questionnaire_path(patient, patient.ssi_questionnaire)
  end

  it_behaves_like 'a questionnaire', name: 'SSI'
  it_behaves_like 'a UTI/SSI questionnaire', type: 'ssi'
end

