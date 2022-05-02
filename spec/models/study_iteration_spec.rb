# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudyIteration do
  include ActiveJob::TestHelper

  subject { study_iteration }

  let(:study_iteration) { create(:study_iteration, acceptance_state: :pending) }
  let!(:department) { create(:department, hospital: create(:hospital, country: study_iteration.country)) }

  before do
    study_iteration.study_ranges.create! start: 14.days.from_now, end: 30.days.from_now
  end

  context 'when changed from pending to active' do
    let(:approve) { study_iteration.update(acceptance_state: :accepted) }

    before do
      study_iteration.update(acceptance_state: :pending)
    end

    describe 'depending records' do
      it 'creates a department questionnaire' do
        expect do
          approve
        end.to change(DepartmentQuestionnaire, :count).by(1)
      end

      it 'does not create a department questionnaire twice' do
        expect do
          approve
          approve
        end.to change(DepartmentQuestionnaire, :count).by(1)
      end
    end

    describe 'notifications' do
      it 'broadcasts an announcement for users of that country' do
        perform_enqueued_jobs do
          user = create(:user, country: study_iteration.country)
          expect(Notifier).to receive(:notify).with(hash_including(recipient: user, notifiable: study_iteration,
                                                                   action: 'study_iterations.announce'))

          approve
        end
      end
    end
  end
end
