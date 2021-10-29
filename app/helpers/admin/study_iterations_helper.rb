# frozen_string_literal: true

module Admin
  module StudyIterationsHelper
    def admin_study_iteration_nav_link(tab)
      link_to admin_study_iteration_path(@study_iteration, tab: tab), class: "nav-link #{'active' if @tab == tab}" do
        tab.capitalize
      end
    end
  end
end
