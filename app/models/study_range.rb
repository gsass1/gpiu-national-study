# frozen_string_literal: true

class StudyRange < ApplicationRecord
  START_TRESHOLD = if (!Rails.env.production? || Gpiu.staging?) && !Rails.env.test?
                     0
                   else
                     14
                   end

  belongs_to :study_iteration

  validates :start, presence: true
  validates :end, presence: true

  validate :start_after_treshold
  validate :end_after_start
  validate :no_overlaps

  default_scope { order(start: :asc) }

  after_initialize :set_default_values

  def active?
    active_on? current_local_day
  end

  def active_on?(date)
    date >= start && date <= self.end
  end

  def passed?
    current_local_day > self.end
  end

  def pending?
    current_local_day < start
  end

  def duration
    (self.end - start).to_i
  end

  def can_be_removed?
    !((self.active? || self.passed?) && self.study_iteration.accepted?)
  end

  private

  def start_after_treshold
    return unless start < (Date.today + START_TRESHOLD.days)

    errors.add(:start, "has to occur at least #{START_TRESHOLD} days in the future")
  end

  def end_after_start
    errors.add(:end, 'must be after the Start Date') if self.end < start
  end

  def no_overlaps
    study_iteration.study_ranges.each do |range|
      if id != range.id && start <= range.end && range.start <= self.end
        errors.add(:start, 'is overlapping with another range. Please check above.')
      end
    end
  end

  def set_default_values
    self.start ||= Date.today + START_TRESHOLD.days
    self.end ||= self.start + 1.day
  end

  def current_local_day
    study_iteration.country.current_local_day
  end
end
