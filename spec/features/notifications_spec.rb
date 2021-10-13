require 'rails_helper'

RSpec.describe 'Notifications', type: :feature do
  let(:user) { create(:user) }
  let(:actor) { create(:user) }

  before :each do
    sign_in(user)
  end

  it 'shows the users current notifications' do
    Notification.create actor: actor, recipient: user, action: 'hospitals.submission', notifiable: create(:hospital)

    visit notifications_path
    expect(page).to have_content("Hospital Submitted For Approval")
  end

  it 'navbar shows the unread notifications count and is cleared after visiting the notifications page' do
    10.times do
      Notification.create actor: actor, recipient: user, action: 'hospitals.submission', notifiable: create(:hospital)
    end

    visit dashboard_index_path
    expect(page).to have_selector(:css, '.unread-notifications-badge', text: '10')

    visit notifications_path
    expect(page).to_not have_selector(:css, '.unread-notifications-badge')
  end
end
