# frozen_string_literal: true

class StudyCalendarController < ApplicationController
  include ActiveStudyIteration
  include Authenticated

  def index
    @country = current_user.country
    @study_iterations = @country.study_iterations.accepted

    return unless @study_iterations.any?

    @study_ranges = StudyRange.where(study_iteration_id: @study_iterations.pluck(:id))
    @months = CalendarUtil.collect_months(@study_ranges.first.start, @study_ranges.last.end)
  end
end
