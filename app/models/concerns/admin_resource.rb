module AdminResource
  extend ActiveSupport::Concern

  class_methods do
    attr_writer :admin_table_fields
    attr_writer :admin_form_fields
    attr_writer :admin_associations
    attr_accessor :admin_custom_actions_proc

    def admin_table_fields
      @admin_table_fields || []
    end

    def admin_form_fields 
      @admin_form_fields || []
    end

    def admin_associations
      @admin_associations || []
    end

    def admin_custom_actions(actions_proc)
      self.admin_custom_actions_proc = actions_proc
    end

    def viewable_admin_table_fields(*fields)
      self.admin_table_fields = fields
    end

    def viewable_admin_associations(*assocs)
      self.admin_associations = assocs
    end

    def editable_admin_fields(*fields)
      self.admin_form_fields = fields
    end
  end
end
