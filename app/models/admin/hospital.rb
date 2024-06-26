# frozen_string_literal: true

module Admin
  class Hospital
    include AdminResource

    viewable_admin_table_fields :name, :address, :country, :acceptance_state
    viewable_admin_associations :departments, :patients
    editable_admin_fields       :name, :country, address: %i[street zip_code city]

    admin_custom_actions :admin_actions

    def self.admin_actions(h)
      arr = [{
        name: 'View',
        color: :info,
        route: [:hospital_path, h]
      }]

      if h.pending?
        arr.push({
                   name: 'Accept',
                   color: :success,
                   method: :post,
                   route: [:regional_admin_country_hospital_set_state_path, h.country.iso_2, h.id, { state: :accepted }]
                 })

        arr.push({
                   name: 'Decline',
                   color: :danger,
                   method: :post,
                   route: [:regional_admin_country_hospital_set_state_path, h.country.iso_2, h.id, { state: :declined }]
                 })
      end

      arr
    end
  end
end
