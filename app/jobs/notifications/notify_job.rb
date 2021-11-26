# frozen_string_literal: true

module Notifications
  class NotifyJob < ApplicationJob
    queue_as :default

    def perform(notification:)
      Notifier.notify(**notification)
    end
  end
end
