# frozen_string_literal: true

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
  it_behaves_like 'a UTI/SSI questionnaire', type: 'uti'
end
