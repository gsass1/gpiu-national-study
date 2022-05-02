# frozen_string_literal: true

class StudyCalendarController < ApplicationController
  include ActiveStudyIteration
  include Authenticated

  def index
    @country = current_user.country
    @study_iterations = @country.current_and_upcoming_study_iterations

    return unless @study_iterations.any?

    @study_ranges = @study_iterations.sum(&:study_ranges)
    @months = CalendarUtil.collect_months(@study_ranges.first.start, @study_ranges.last.end)
  end
end
