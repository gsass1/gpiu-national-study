# frozen_string_literal: true

module Notifications
  class NotifyRegionalAdminsJob < ApplicationJob
    queue_as :default

    def perform(country:, notification:)
      users = User.with_role(:regional_admin, country).to_a

      users.each do |user|
        NotifyJob.perform_later(notification: notification.merge(recipient: user))
      end
    end
  end
end
