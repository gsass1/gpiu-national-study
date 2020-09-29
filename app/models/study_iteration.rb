class StudyIteration < ApplicationRecord
  belongs_to :country

  has_many :study_ranges

  enum acceptance_state: [:pending, :accepted, :declined]
  validates :name, presence: true

  before_create :set_pending

  # TODO(gian): this creates a lot of SQL queries I think. For production we need a fast SQL query
  def active?
    study_ranges.any? { |range| range.active?  }
  end

  def passed?
    study_ranges.all? { |range| range.passed?  }
  end

  def duration
    study_ranges.sum { |range| range.duration }
  end

  private
  def set_pending
    self.acceptance_state = 0
  end
end
