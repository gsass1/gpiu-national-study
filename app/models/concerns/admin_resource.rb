# frozen_string_literal: true

module AdminResource
  extend ActiveSupport::Concern

  class_methods do
    attr_writer :table_fields
    attr_writer :form_fields
    attr_writer :associations
    attr_accessor :custom_actions_proc

    def table_fields
      @table_fields || []
    end

    def form_fields
      @form_fields || []
    end

    def associations
      @associations || []
    end

    def admin_custom_actions(actions_proc)
      self.custom_actions_proc = actions_proc
    end

    def viewable_admin_table_fields(*fields)
      self.table_fields = fields
    end

    def viewable_admin_associations(*assocs)
      self.associations = assocs
    end

    def editable_admin_fields(*fields)
      self.form_fields = fields
    end
  end
end
