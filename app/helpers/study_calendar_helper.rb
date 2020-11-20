module StudyCalendarHelper
  def month_weeks(month, year)
    weeks = 6

    first_day_of_month = Date.new(year, month, 1)
    first_cweek = first_day_of_month.cweek

    # I think this is correct?
    if first_cweek == 53
      first_day = Date.commercial(year - 1, first_cweek)
    else
      first_day = Date.commercial(year, first_cweek)
    end

    result = []

    for week_index in 0..(weeks-1)
      days = []
      for day_index in 0..6
        days[day_index] = first_day + day_index.days + (week_index * 7).days
      end
      result.append(days)
    end

    result
  end

  def calendar_study_itr_color(day, study_iterations)
    study_iterations.each do |si|
      if si.active_on?(day)
        if day == Date.today
          return "bg-success text-dark border border-danger font-weight-bold"
        elsif day < Date.today
          return "bg-secondary text-light"
        else
          return "bg-primary text-light"
        end
      end
    end
  end

  def calendar_week_class(week)
    if Date.today.cweek == week
      #"font-weight-bold border border-danger"
    end
  end
end
