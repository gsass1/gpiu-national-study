# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Notifications', type: :feature do
  let(:user) { create(:user) }
  let(:actor) { create(:user) }

  before do
    sign_in(user)
    Notification.destroy_all
  end

  it 'shows the users current notifications' do
    Notification.create actor: actor, recipient: user, action: 'hospitals.submission', notifiable: create(:hospital)

    visit notifications_path
    expect(page).to have_content('Hospital Submitted For Approval')
  end

  it 'navbar shows the unread notifications count and is cleared after visiting the notifications page' do
    10.times do
      Notification.create actor: actor, recipient: user, action: 'hospitals.submission', notifiable: create(:hospital)
    end

    visit dashboard_index_path
    expect(page).to have_selector(:css, '.unread-notifications-badge', text: '10')

    visit notifications_path
    expect(page).not_to have_selector(:css, '.unread-notifications-badge')
  end

  it 'can dismiss notifications' do
    Notification.create actor: actor, recipient: user, action: 'hospitals.submission', notifiable: create(:hospital)

    visit notifications_path
    expect(page).to have_content('Hospital Submitted For Approval')

    click_link '✖'
    expect(page).to have_content('Removed notification')
    expect(page).to_not have_content('Hospital Submitted For Approval')
  end

  describe 'notifications dropdown' do
    let!(:notification) { create(:notification, recipient: user, actor: actor) }

    before do
      visit dashboard_index_path
    end

    it 'opens dropdown which displays current notifications' do
      find(:css, '#dropdownNotificationsLink').click

      expect(page).to have_selector('#notifications-dropdown')

      within '#notifications-dropdown' do
        expect(page).to have_content('Hospital Submitted For Approval')
      end
    end
  end
end
