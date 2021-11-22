# frozen_string_literal: true

class StudyIteration < ApplicationRecord
  include Notifiable

  belongs_to :country

  has_many :study_ranges, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :department_questionnaires, dependent: :destroy
  has_many :departments, through: :department_questionnaires

  enum acceptance_state: { unsubmitted: 0, pending: 1, accepted: 2, declined: 3 }
  validates :name, presence: true

  before_create :set_pending

  scope :accepted, -> { where(acceptance_state: :accepted) }

  after_update :create_records_if_approved

  notify_with(proc { |f|
    {
      country_name: f.country.name,
      admin_link: Rails.application.routes.url_helpers.admin_study_iteration_url(f.id)
    }
  })

  def active?
    study_ranges.any?(&:active?)
  end

  def active_range
    study_ranges.select(&:active?).first
  end

  def passed?
    study_ranges.all?(&:passed?)
  end

  def duration
    study_ranges.sum(&:duration)
  end

  def next_range
    study_ranges.select(&:pending?).first
  end

  def active_on?(date)
    study_ranges.any? { |range| range.active_on?(date) }
  end

  def study_year
    study_ranges.first.start.year
  end

  def to_s
    name
  end

  def request_permission_timeout?
    return false if requested_export_permission_at.nil?

    DateTime.now.to_i - requested_export_permission_at.to_i <= REQUEST_EXPORT_PERMISSION_TIMEOUT_DURATION.to_i
  end

  def request_permission_timeout!
    self.requested_export_permission_at = DateTime.now
  end

  private

  REQUEST_EXPORT_PERMISSION_TIMEOUT_DURATION = 24.hours

  def set_pending
    self.acceptance_state = 0 if acceptance_state.nil?
  end

  def create_records_if_approved
    return unless acceptance_state_previously_changed? && accepted?

    Department.includes(:hospital)
              .where(hospitals: { country_id: country_id })
              .find_each(&:create_department_questionnaire)
  end
end
