# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NotificationsMailer, type: :mailer do
  describe 'notification_email' do
    let(:notification) { create(:notification) }
    let(:options_hash) do
      {
        actor_id: notification.actor.id,
        recipient_id: notification.recipient.id,
        action: notification.action,
        notifiable_id: notification.notifiable.id,
        notifiable_class: notification.notifiable.class.to_s
      }
    end

    let(:mail) { described_class.with(notification: options_hash).notification_email }

    it 'renders the subject' do
      expect(mail.subject).to eq('Hospital Submitted For Approval')
    end
  end
end
