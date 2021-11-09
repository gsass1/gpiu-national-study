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
      single_form_fields - all_associations
    end

    def nested_field_attributes
      nested_form_fields.map { |k, v| { "#{k}_attributes" => v } }
    end

    def single_form_fields
      form_fields.reject { |f| f.is_a?(Hash) }
    end

    def nested_form_fields
      form_fields.filter { |f| f.is_a?(Hash) }.first || {}
    end

    def controller_params
      fields_excluding_associations + all_associations_with_id + nested_field_attributes
    end

    def enum_values(field)
      resource_class.send(field.to_s.pluralize).keys
    end
  end
end
