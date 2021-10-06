class Admin::Country
  include AdminResource

  viewable_admin_table_fields :name, :iso_2, :iso_3
  editable_admin_fields :name, :iso_2, :iso_3, :timezone
  admin_custom_actions :admin_actions

  def self.admin_actions(country)
    [{
      name: "Open Regional Admin Dashboard",
      color: :success,
      route: [:regional_admin_country_dashboard_index_path, country.iso_2],
    }]
  end
end
