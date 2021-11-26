# frozen_string_literal: true

module StudyIterations
  module Approvable
    extend ActiveSupport::Concern

    included do
      enum acceptance_state: { unsubmitted: 0, pending: 1, accepted: 2, declined: 3 }

      scope :accepted, -> { where(acceptance_state: :accepted) }
      scope :pending, -> { where(acceptance_state: :pending) }

      after_initialize :set_initial_acceptance_state

      after_save :remember_decision
      after_save_commit :broadcast_submission,           if: :was_submitted?
      after_save_commit :broadcast_approval_decision,    if: :was_accepted?
      after_save_commit :broadcast_declination_decision, if: :was_declined?
    end

    private

    def set_initial_acceptance_state 
      self.acceptance_state = 0 if acceptance_state.nil?
    end

    def remember_decision
      @was_submitted = acceptance_state_previously_changed?(to: 'pending')
      @was_accepted  = acceptance_state_previously_changed?(to: 'accepted')
      @was_declined  = acceptance_state_previously_changed?(to: 'declined')
    end

    def was_accepted?
      @was_accepted
    end

    def was_declined?
      @was_declined
    end

    def was_submitted?
      @was_submitted
    end

    def broadcast_submission
      Notifications::NotifyAdminsJob.perform_later(notification: { notifiable: self, action: 'study_iterations.submission' })
    end

    def broadcast_approval_decision
      push_notifications 'study_iterations.accepted'
    end

    def broadcast_declination_decision
      push_notifications 'study_iterations.rejected'
    end

    def push_notifications(action)
      Notifications::NotifyRegionalAdminsJob.perform_later(country: country, notification: { notifiable: self, action: action })
    end
  end
end
