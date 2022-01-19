# frozen_string_literal: true

module StudyCalendarHelper
  def month_weeks(month, year)
    weeks = 6

    first_day_of_month = Date.new(year, month, 1)
    first_cweek = first_day_of_month.cweek

    # I think this is correct?
    # First of january can either be the 52nd or 53rd calendar week
    first_day = if first_cweek >= 52
                  Date.commercial(year - 1, first_cweek)
                else
                  Date.commercial(year, first_cweek)
                end

    result = []

    (0..(weeks - 1)).each do |week_index|
      days = []
      (0..6).each do |day_index|
        days[day_index] = first_day + day_index.days + (week_index * 7).days
      end
      result.append(days)
    end

    result
  end

  def calendar_study_itr_color(day, study_iterations)
    study_iterations.each do |si|
      next unless si.active_on?(day)

      local_day = si.country.current_local_day

      if day == local_day
        return 'bg-success text-dark border border-danger font-weight-bold'
      elsif day < local_day
        return 'bg-secondary text-light'
      else
        return 'bg-primary text-light'
      end
    end
  end

  def calendar_week_class(week)
    if Date.today.cweek == week
      # "font-weight-bold border border-danger"
    end
  end
end
