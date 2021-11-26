# frozen_string_literal: true

module StudyIterations
  module Notification
    extend ActiveSupport::Concern

    included do
      notify_with(proc { |f|
        {
          country_name: f.country.name,
          admin_link: Rails.application.routes.url_helpers.admin_study_iteration_url(f.id),
          formatted_dates: f.formatted_dates,
          calendar_url: Rails.application.routes.url_helpers.study_calendar_index_url
        }
      })
    end

    def formatted_dates
      return "" unless study_ranges.any?

      study_ranges.collect do |range|
        "#{I18n.l(range.start, format: :long)} - #{I18n.l(range.end, format: :long)}"
      end.join('<br/>')
    end
  end
end
