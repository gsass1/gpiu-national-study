# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification do
  subject { create(:notification) }

  it 'deleting its notifiable also deletes the notification' do
    subject

    expect {
      subject.notifiable.destroy
    }.to change(Notification, :count).by(-1)
  end
end
