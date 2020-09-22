module AdminResource
  extend ActiveSupport::Concern

  class_methods do
    attr_accessor :admin_table_fields
    attr_accessor :admin_form_fields

    def viewable_admin_table_fields(*fields)
      self.admin_table_fields = fields
    end

    def editable_admin_fields(*fields)
      self.admin_form_fields = fields
    end
  end
end
