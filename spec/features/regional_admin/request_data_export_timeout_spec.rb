# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regional Admins > Request data export permission > Timeout' do
  include_context 'within study iteration'
  let(:user) { create(:regional_admin) }

  before do
    create(:admin)

    sign_in(user)
    travel 100.days
  end

  context 'when first time requested' do
    it 'creates a notification' do
      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')

      expect(Notifier).to receive(:notify)

      accept_alert do
        click_link 'Request'
      end

      expect(page).to have_content('Request for export permission has been sent to the super admins.')
    end
  end

  context 'second time without delay' do
    before do
      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')

      accept_alert do
        click_link 'Request'
      end

      expect(page).to have_content('Request for export permission has been sent to the super admins.')

      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')
    end

    it 'disables the button' do
      expect(page).not_to have_link('Request')
    end
  end

  context 'third time with delay' do
    before do
      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')

      accept_alert do
        click_link 'Request'
      end

      expect(page).to have_content('Request for export permission has been sent to the super admins.')

      travel 25.hours

      visit edit_regional_admin_country_study_iteration_path(user.country, study_iteration, tab: 'data')
    end

    it 'creates a notification' do
      expect(Notifier).to receive(:notify)

      accept_alert do
        click_link 'Request'
      end

      expect(page).to have_content('Request for export permission has been sent to the super admins.')
    end
  end
end
