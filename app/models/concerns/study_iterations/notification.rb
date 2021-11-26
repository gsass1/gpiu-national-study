# frozen_string_literal: true

module StudyIterations
  module Notification
    extend ActiveSupport::Concern

    included do
      notify_with(proc { |f|
        {
          country_name: f.country.name,
          admin_link: Rails.application.routes.url_helpers.admin_study_iteration_url(f.id)
        }
      })
    end
  end
end
