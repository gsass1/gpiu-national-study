class StudyCalendarController < ApplicationController
  include ActiveStudyIteration
  include Authenticated

  def index
    @study_iterations = current_user.country.study_iterations.accepted

    if @study_iterations.any?
      @study_ranges = StudyRange.where(study_iteration_id: @study_iterations.pluck(:id))
      @months = CalendarUtil::collect_months(@study_ranges.first.start, @study_ranges.last.end)
    end
  end
end
