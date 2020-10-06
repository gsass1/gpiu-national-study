class StudyIteration < ApplicationRecord
  include Notifiable

  belongs_to :country

  has_many :study_ranges
  has_many :patients

  enum acceptance_state: [:unsubmitted, :pending, :accepted, :declined]
  validates :name, presence: true

  before_create :set_pending

  scope :accepted, -> { where(:acceptance_state => :accepted) }

  notify_with Proc.new { |f| { country_name: f.country.name } }

  # TODO(gian): this creates a lot of SQL queries I think. For production we need a fast SQL query
  def active?
    study_ranges.any? { |range| range.active?  }
  end

  def active_range
    study_ranges.select { |range| range.active?  }.first
  end

  def passed?
    study_ranges.all? { |range| range.passed?  }
  end

  def duration
    study_ranges.sum { |range| range.duration }
  end

  def next_range
    study_ranges.select { |range| range.pending? }.first
  end

  def to_s
    name
  end

  private
  def set_pending
    self.acceptance_state = 0
  end
end
