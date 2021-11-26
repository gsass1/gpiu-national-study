# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regional Admins > Hospital Approval' do
  include ActiveJob::TestHelper

  let(:user) { create(:regional_admin) }
  let(:hospital) { create(:hospital, country: user.country, acceptance_state: :pending) }

  before do
    sign_in(user)
  end

  context 'hospital is pending' do
    before do
      visit regional_admin_country_hospital_path(hospital.country, hospital)
    end

    it 'shows the Accept and Decline buttons' do
      expect(page).to have_link('Accept')
      expect(page).to have_link('Decline')
    end

    context 'user clicks the Accept button' do
      it 'accepts the hospital' do
        click_link 'Accept'
        expect(hospital.reload.acceptance_state).to eq('accepted')
      end

      it 'notifies the hospital creator' do
        perform_enqueued_jobs do
          expect(Notifier).to receive(:notify).with(hash_including(recipient: hospital.user,
                                                                   action: 'hospitals.accepted', notifiable: hospital))
          click_link 'Accept'
        end
      end
    end

    context 'user clicks the Decline button' do
      it 'rejects the hospital' do
        click_link 'Decline'
        expect(hospital.reload.acceptance_state).to eq('declined')
      end

      it 'notifies the hospital creator' do
        perform_enqueued_jobs do
          expect(Notifier).to receive(:notify).with(hash_including(recipient: hospital.user,
                                                                   action: 'hospitals.rejected', notifiable: hospital))
          click_link 'Decline'
        end
      end
    end
  end

  context 'hospital is accepted' do
    before do
      hospital.update(acceptance_state: :accepted)
      visit regional_admin_country_hospital_path(hospital.country, hospital)
    end

    it 'does not show the action buttons' do
      expect(page).not_to have_link('Accept')
      expect(page).not_to have_link('Decline')
    end
  end

  context 'hospital is declined' do
    before do
      hospital.update(acceptance_state: :declined)
      visit regional_admin_country_hospital_path(hospital.country, hospital)
    end

    it 'does not show the action buttons' do
      expect(page).not_to have_link('Accept')
      expect(page).not_to have_link('Decline')
    end
  end
end
