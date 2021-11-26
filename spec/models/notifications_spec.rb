# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification do
  it 'deleting its notifiable also deletes the notification' do
    Notification.destroy_all
    notification = create(:notification)

    expect {
      notification.notifiable.destroy
    }.to change(Notification, :count).by(-1)
  end
end
