class StudyRange < ApplicationRecord
  belongs_to :study_iteration

  validates :start, presence: true
  validates :end, presence: true

  validate :is_in_the_future
  validate :end_after_start
  validate :no_overlaps

  default_scope { order(start: :asc) }

  def active?
    Date.today >= self.start && Date.today <= self.end
  end

  def passed?
    Date.today > self.end
  end

  def duration
    (self.end - self.start).to_i
  end

  private
  def is_in_the_future
    if self.start <= Date.today
      errors.add(:start, "has to start in the future!")
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
        errors.add(:start, "Chosen date range overlaps with other range")
      end
    end
  end
end