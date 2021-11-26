# frozen_string_literal: true

module Hospitals
  module Approvable
    extend ActiveSupport::Concern

    included do
      enum acceptance_state: { pending: 0, accepted: 1, declined: 2 }

      after_initialize :set_initial_acceptance_state

      scope :accepted, -> { where(acceptance_state: :accepted) }
      scope :pending, -> { where(acceptance_state: :pending) }

      after_create :remember_submission
      after_save :remember_decision
      after_save_commit :broadcast_submission,  if: :was_submitted?
      after_save_commit :broadcast_approval,    if: :was_accepted?
      after_save_commit :broadcast_declination, if: :was_declined?
    end

    private

    def set_initial_acceptance_state 
      self.acceptance_state = 0 if acceptance_state.nil?
    end

    def remember_submission
      @was_submitted = true
    end

    def remember_decision
      @was_accepted  = acceptance_state_previously_changed?(to: 'accepted')
      @was_declined  = acceptance_state_previously_changed?(to: 'declined')
    end

    def was_submitted?
      @was_submitted
    end

    def was_accepted?
      @was_accepted
    end

    def was_declined?
      @was_declined
    end

    def broadcast_submission
      Notifications::NotifyRegionalAdminsJob.perform_later(country: country, notification: { notifiable: self, action: 'hospitals.submission' })
    end

    def broadcast_approval
      push_notifications 'hospitals.accepted'
    end

    def broadcast_declination
      push_notifications 'hospitals.rejected'
    end

    def push_notifications(action)
      Notifications::NotifyJob.perform_later(notification: { notifiable: self, recipient: user, action: action })
    end
  end
end
