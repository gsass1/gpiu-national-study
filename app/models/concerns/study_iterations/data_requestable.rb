# frozen_string_literal: true

module StudyIterations
  module DataRequestable
    extend ActiveSupport::Concern

    included do
      after_save_commit :broadcast_export_data_request, if: :requested_export_permission?
    end

    def request_permission_timeout?
      return false if requested_export_permission_at.nil?

      DateTime.now.to_i - requested_export_permission_at.to_i <= REQUEST_EXPORT_PERMISSION_TIMEOUT_DURATION.to_i
    end

    def request_export_permission
      @requested_export_permission = true

      update(requested_export_permission_at: DateTime.now)
    end

    private

    REQUEST_EXPORT_PERMISSION_TIMEOUT_DURATION = 24.hours

    def requested_export_permission?
      @requested_export_permission
    end

    def broadcast_export_data_request
      Notifications::NotifyAdminsJob.perform_later(notification: { notifiable: self, action: 'study_iterations.request_export_permission' })
    end
  end
end
