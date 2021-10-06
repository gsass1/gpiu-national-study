class Admin::SupportRequest
  include AdminResource

  viewable_admin_table_fields :user, :email, :support_type, :custom_support_type
  editable_admin_fields :user, :email, :support_type, :custom_support_type, :message, :state
end
