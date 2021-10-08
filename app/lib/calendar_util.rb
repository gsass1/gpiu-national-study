# frozen_string_literal: true

module CalendarUtil
  def self.collect_months(first_date, last_date)
    months = []
    current_month = first_date.month
    year = first_date.year

    total_months = ((last_date - first_date).to_i / 30.0).ceil

    total_months.times do
      if current_month > 12
        current_month = 1
        year += 1
      end

      months.append year: year, month: current_month

      current_month += 1
    end

    months
  end
end
