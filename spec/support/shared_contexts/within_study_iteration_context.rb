# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context 'within study iteration', shared_context: :metadata do
  let(:hospital) { create(:hospital, country: user.country) }
  let(:department) { create(:department, hospital: hospital) }
  let!(:employment) { create(:employee, user: user, department: department) }
  let(:study_iteration) { create(:study_iteration, country: user.country, acceptance_state: 'accepted') }

  before do
    study_iteration.study_ranges.create!(start: 14.days.from_now, end: 30.days.from_now)
    department.create_department_questionnaire
    travel 14.days
  end
end
