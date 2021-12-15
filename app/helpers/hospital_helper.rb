# frozen_string_literal: true

module HospitalHelper
  def hospital_nav_link(tab)
    link_to hospital_path(@hospital, tab: tab), class: "nav-link #{'active' if current_tab == tab}" do
      t("hospitals.show.tabs.#{tab}")
    end
  end

  def hospital_index_nav_link(tab)
    link_to hospitals_path(tab: tab), class: "nav-link #{'active' if current_tab == tab}" do
      t("hospitals.index.tabs.#{tab}")
    end
  end
end
