# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification do
  it 'deleting its notifiable also deletes the notification' do
    described_class.destroy_all
    notification = create(:notification)

    expect do
      notification.notifiable.destroy
    end.to change(described_class, :count).by(-1)
  end
end
