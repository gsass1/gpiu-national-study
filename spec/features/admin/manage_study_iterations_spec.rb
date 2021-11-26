# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin > Manage Study Iterations' do
  include_context 'with admin user'

  let!(:regional_admin_user) { create(:regional_admin) }
  let!(:study_iteration) { create(:study_iteration, country: regional_admin_user.country) }

  before do
    study_iteration.study_ranges.create! start: 30.days.from_now, end: 60.days.from_now
    study_iteration.update(acceptance_state: :pending)
    visit admin_study_iteration_path(study_iteration, tab: 'actions')
  end

  describe 'approval' do
    include ActiveJob::TestHelper

    it 'approves the study iteration' do
      click_link 'Approve'
      expect(page).to have_content('Approved study iteration')
    end

    it 'notifies the regional admins' do
      expect(Notifier).to receive(:notify).with(hash_including(recipient: regional_admin_user, notifiable: study_iteration, action: 'study_iterations.accepted'))

      perform_enqueued_jobs do
        click_link 'Approve'
      end
    end
  end

  describe 'declination' do
    include ActiveJob::TestHelper

    it 'declines the study iteration' do
      click_button 'Reject'
      expect(page).to have_content('Rejected study iteration')
    end

    it 'notifies the regional admins' do
      expect(Notifier).to receive(:notify).with(hash_including(recipient: regional_admin_user, notifiable: study_iteration, action: 'study_iterations.rejected'))

      perform_enqueued_jobs do
        click_button 'Reject'
      end
    end
  end
end
