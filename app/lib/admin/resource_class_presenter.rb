# frozen_string_literal: true

module Admin
  class ResourceClassPresenter
    attr_reader :resource_class, :resource_admin_class

    delegate :form_fields, to: :resource_admin_class
    delegate :associations, to: :resource_admin_class
    delegate :custom_actions_proc, to: :resource_admin_class
    delegate :human_attribute_name, to: :resource_class

    def initialize(resource_class:)
      @resource_class = resource_class
      @resource_admin_class = "Admin::#{resource_class.name}".constantize
    end

    def table_fields
      [:id] + resource_admin_class.table_fields
    end

    def field_can_be_sorted?(field)
      # Only if this is an actual model column
      resource_class.column_names.include?(field.to_s)
    end

    def can_be_exported?
      resource_class.included_modules.include?(CsvCollection)
    end

    def can_be_discarded?
      resource_class.included_modules.include?(Discard::Model)
    end

    def association?(name)
      resource_admin_class.associations.include?(name)
    end

    def enum?(name)
      !resource_class.try(name.to_s.pluralize.to_sym).nil?
    end

    def all_associations
      resource_class.reflect_on_all_associations.map(&:name) & resource_admin_class.table_fields
    end

    def all_associations_with_id
      all_associations.map { |f| "#{f}_id".to_sym }
    end

    def fields_excluding_associations
      resource_admin_class.form_fields - all_associations
    end
  end
end
