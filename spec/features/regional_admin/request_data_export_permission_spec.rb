# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regional Admins > Request data export permission' do
  let(:user) { create(:regional_admin) }
  let(:study_iteration) { create(:study_iteration, country: user.country) }

  before do
    sign_in(user)
  end

  shared_examples 'cannot request permission' do
    it do
      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')

      expect(page).not_to have_link('Request')
      expect(page).not_to have_content('Request Export Permission')
    end
  end

  context 'when study iteration is unsubmitted' do
    before do
      study_iteration.update(acceptance_state: :unsubmitted)
    end

    it_behaves_like 'cannot request permission'
  end

  context 'when study iteration is pending' do
    before do
      study_iteration.update(acceptance_state: :pending)
    end

    it_behaves_like 'cannot request permission'
  end

  context 'when study iteration is accepted' do
    before do
      study_iteration.study_ranges.create! start: 30.days.from_now, end: 60.days.from_now
      study_iteration.update(acceptance_state: :accepted)
    end

    context 'when study iteration has not yet passed' do
      it_behaves_like 'cannot request permission'
    end

    context 'when study iteration has passed' do
      before do
        travel 90.days
        visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')
      end

      it 'shows the request export permission dialog' do
        expect(page).to have_content('Request Export Permission')
      end

      context 'when the request button is clicked' do
        it 'notifies the admins' do
          admin = create(:admin)
          expect(Notifier).to receive(:notify).with(hash_including(notifiable: study_iteration, recipient: admin,
                                                                   action: 'study_iterations.request_export_permission'))

          accept_alert do
            click_link 'Request'
          end
        end
      end
    end
  end
end
