# frozen_string_literal: true

class StudyCalendarController < ApplicationController
  include ActiveStudyIteration
  include Authenticated

  def index
    @country = current_user.country
    @study_iteration = @country.next_or_current_study_iteration

    return if @study_iteration.nil?

    @study_ranges = @study_iteration.study_ranges
    @months = CalendarUtil.collect_months(@study_ranges.first.start, @study_ranges.last.end)
  end
end
