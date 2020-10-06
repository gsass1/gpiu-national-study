class StudyCalendarController < ApplicationController
  include ActiveStudyIteration
  include Authenticated

  def index
    @study_iterations = current_user.country.study_iterations.accepted
    @months = [] 

    if @study_iterations.any?
      @study_ranges = StudyRange.where(study_iteration_id: @study_iterations.pluck(:id))

      @first_date = @study_ranges.first.start
      @last_date = @study_ranges.last.end

      current_month = @first_date.month
      year = @first_date.year

      total_months = ((@last_date - @first_date).to_i / 30.0).ceil

      total_months.times do
        if current_month > 12
          current_month = 1
          year = year + 1
        end

        @months.append year: year, month: current_month

        current_month = current_month + 1
      end
    end
  end
end
