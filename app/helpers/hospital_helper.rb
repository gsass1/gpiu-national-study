module HospitalHelper
  def hospital_nav_link(tab)
    link_to hospital_path(@hospital, tab: tab), class: "nav-link #{"active" if @tab == tab}" do
      t("hospitals.show.tabs.#{tab}")
    end
  end
end
