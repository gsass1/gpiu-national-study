# frozen_string_literal: true

module Notifications
  class NotifyAdminsJob < ApplicationJob
    queue_as :default

    def perform(notification:)
      users = User.with_role(:admin).to_a

      users.each do |user|
        NotifyJob.perform_later(notification: notification.merge(recipient: user))
      end
    end
  end
end
