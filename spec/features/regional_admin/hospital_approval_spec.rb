require 'rails_helper'

RSpec.describe 'Regional Admins > Hospital Approval' do
  let(:user) { create(:regional_admin) }
  let(:hospital) { create(:hospital, country: user.country, acceptance_state: :pending) }

  before do
    sign_in(user)
  end

  context 'hospital is pending' do
    before do
      visit regional_admin_country_hospital_path(hospital.country, hospital)
    end

    it 'shows the Accept and Reject buttons' do
      expect(page).to have_link('Accept')
      expect(page).to have_link('Reject')
    end

    context 'user clicks the Accept button' do
      it 'accepts the hospital' do
        click_link 'Accept'
        expect(hospital.reload.acceptance_state).to eq('approved')
      end

      it 'notifies the hospital creator' do
        expect(Notifier).to receive(:notify).with(hash_including(recipient: hospital.user, action: 'hospitals.accepted', notifiable: hospital))
        click_link 'Accept'
      end
    end

    context 'user clicks the Reject button' do
      it 'rejects the hospital' do
        click_link 'Reject'
        expect(hospital.reload.acceptance_state).to eq('rejected')
      end

      it 'notifies the hospital creator' do
        expect(Notifier).to receive(:notify).with(hash_including(recipient: hospital.user, action: 'hospitals.rejected', notifiable: hospital))
        click_link 'Reject'
      end
    end
  end

  context 'hospital is accepted' do
    before do
      hospital.update(acceptance_state: :approved)
      visit regional_admin_country_hospital_path(hospital.country, hospital)
    end

    it 'does not show the action buttons' do
      expect(page).not_to have_link('Accept')
      expect(page).not_to have_link('Reject')
    end
  end

  context 'hospital is rejected' do
    before do
      hospital.update(acceptance_state: :rejected)
      visit regional_admin_country_hospital_path(hospital.country, hospital)
    end

    it 'does not show the action buttons' do
      expect(page).not_to have_link('Accept')
      expect(page).not_to have_link('Reject')
    end
  end
end
