# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regional Admins > Submit study iteration' do
  let(:user) { create(:regional_admin) }
  let(:study_iteration) { create(:study_iteration, country: user.country) }

  before do
    sign_in(user)
  end

  context 'when the study iteration is empty' do
    before do
      study_iteration.study_ranges.destroy_all
      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'actions')
    end

    it 'disables the submit button' do
      expect(page).to have_button('Submit', disabled: true)
    end
  end

  context 'when the study iteration has at least one study range' do
    before do
      study_iteration.study_ranges.create! start: 30.days.from_now, end: 60.days.from_now
      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'actions')
    end

    it 'enables the submit button' do
      expect(page).to have_link('Submit')
    end

    context 'when the user clicks the submit button' do
      include ActiveJob::TestHelper

      it 'sets the acceptance state to pending' do
        accept_alert do
          click_link 'Submit'
        end

        expect(page).to have_content('Submitted for approval')
        expect(study_iteration.reload.acceptance_state).to eq('pending')
      end

      it 'notifies the admins' do
        perform_enqueued_jobs do
          admin = create(:admin)
          expect(Notifier).to receive(:notify).with(hash_including(recipient: admin, notifiable: study_iteration,
                                                                   action: 'study_iterations.submission'))

          accept_alert do
            click_link 'Submit'
          end

          expect(page).to have_content('Submitted for approval')
        end
      end
    end
  end
end
