# frozen_string_literal: true

module Notifications
  class NotifyCountryJob < ApplicationJob
    queue_as :default

    def perform(country:, notification:)
      users = country.users.to_a

      users.each do |user|
        NotifyJob.perform_later(notification: notification.merge(recipient: user))
      end
    end
  end
end
