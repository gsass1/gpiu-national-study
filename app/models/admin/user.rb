class Admin::User
  include AdminResource

  viewable_admin_table_fields :title, :first_name, :last_name, :email, :country
  editable_admin_fields :title, :first_name, :last_name, :email, :country
  viewable_admin_associations :hospitals, :patients, :support_requests
end
