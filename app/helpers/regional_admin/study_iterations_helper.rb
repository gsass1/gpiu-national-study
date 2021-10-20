# frozen_string_literal: true

module RegionalAdmin
  module StudyIterationsHelper
    def range_state(range)
      if range.active?
        'Active'
      elsif Date.today > range.end
        'Passed'
      else
        days = (range.start - Date.today).to_i
        "Pending (#{days} days remaining)"
      end
    end

    def itr_color_table(itr)
      if itr.unsubmitted?
        'table-itr-unsubmitted'
      elsif itr.pending?
        'table-itr-pending'
      elsif itr.accepted?
        'table-itr-accepted'
      elsif itr.declined?
        'table-itr-declined'
      end
    end

    def range_color_table(range)
      if range.active?
        'table-success'
      elsif range.passed?
        'table-primary'
      elsif range.pending?
        'table-default'
      end
    end

    def regional_admin_study_iteration_nav_link(tab)
      link_to edit_regional_admin_country_study_iteration_path(@country.iso_2, @study_iteration, tab: tab),
              class: "nav-link #{'active' if @tab == tab}" do
        tab.capitalize
      end
    end
  end
end
