# frozen_string_literal: true

module Admin
  class User
    include AdminResource

    viewable_admin_table_fields :title, :first_name, :last_name, :email, :country
    editable_admin_fields :title, :first_name, :last_name, :email, :country
    viewable_admin_associations :hospitals, :patients, :support_requests
    admin_custom_actions :admin_actions

    def self.admin_actions(user)
      [{
        name: 'Manage Roles',
        color: :primary,
        route: [:admin_user_roles_path, user.id]
      }]
    end
  end
end
