# frozen_string_literal: true

module StudyIterations
  module Schedulable
    extend ActiveSupport::Concern

    included do
      has_many :study_ranges, dependent: :destroy
    end

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

    def first_date
      study_ranges.first.start
    end

    def last_date
      study_ranges.last.end
    end

    def revokable?
      pending? || (accepted? && !study_ranges.any? { |si| si.active? || si.passed? })
    end
  end
end
