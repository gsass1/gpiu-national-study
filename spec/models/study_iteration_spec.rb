# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudyIteration do
  let(:study_iteration) { create(:study_iteration, acceptance_state: :pending) }
  let!(:department) { create(:department, hospital: create(:hospital, country: study_iteration.country)) }
  subject { study_iteration }

  before do
    study_iteration.study_ranges.create! start: 14.days.from_now, end: 30.days.from_now
  end

  context 'when changed from pending to active' do
    let(:approve) { study_iteration.update(acceptance_state: :accepted) }

    before do
      study_iteration.update(acceptance_state: :pending)
    end

    it 'creates a department questionnaire' do
      expect {
        approve
      }.to change(DepartmentQuestionnaire, :count).by(1)
    end

    it 'does not create a department questionnaire twice' do
      expect {
        approve
        approve
      }.to change(DepartmentQuestionnaire, :count).by(1)
    end
  end
end
