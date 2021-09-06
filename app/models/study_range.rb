class StudyRange < ApplicationRecord
  if !Rails.env.production? || ENV['GPIU_STAGING'] == "1"
    START_TRESHOLD = 0
  else
    START_TRESHOLD = 14
  end

  belongs_to :study_iteration

  validates :start, presence: true
  validates :end, presence: true

  #validate :is_in_the_future
  validate :start_after_treshold
  validate :end_after_start
  validate :no_overlaps

  default_scope { order(start: :asc) }

  after_initialize :set_default_values

  def active?
    active_on? Date.today
  end

  def active_on?(date)
    date >= self.start && date <= self.end
  end

  def passed?
    Date.today > self.end
  end

  def pending?
    Date.today < self.start
  end

  def duration
    (self.end - self.start).to_i
  end

  private
  def is_in_the_future
    if self.start <= Date.today
      errors.add(:start, "has to occur in the future!")
    end
  end

  def start_after_treshold
    if self.start < (Date.today + START_TRESHOLD.days)
      errors.add(:start, "has to occur at least #{START_TRESHOLD} days in the future!")
    end
  end

  def end_after_start
    if self.end < start
      errors.add(:start, "must be after the start date")
    end
  end

  def no_overlaps 
    self.study_iteration.study_ranges.each do |range|
      if self.start <= range.end && range.start <= self.end
        errors.add(:start, "is overlapping with another range. Please check above.")
      end
    end
  end

  def set_default_values
    self.start ||= Date.today + START_TRESHOLD.days
    self.end ||= self.start + 1.days
  end
end
