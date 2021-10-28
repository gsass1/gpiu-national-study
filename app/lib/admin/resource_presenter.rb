# frozen_string_literal: true

module Admin
  class ResourcePresenter
    attr_reader :resource, :class_presenter

    delegate :resource_class, to: :class_presenter
    delegate :resource_admin_class, to: :class_presenter
    delegate :id, to: :resource
    delegate :discarded?, to: :resource
    delegate :human_attribute_name, to: :resource_class

    delegate :table_fields, to: :class_presenter
    delegate :form_fields, to: :class_presenter
    delegate :associations, to: :class_presenter
    delegate :custom_actions_proc, to: :class_presenter
    delegate :association?, to: :class_presenter
    delegate :enum?, to: :class_presenter
    delegate :to_s, to: :resource

    def initialize(resource:)
      @resource = resource
      @class_presenter = ResourceClassPresenter.new(resource_class: resource.class)
    end

    def field_value(name)
      resource.send(name)
    end

    def can_do?(user, action)
      Ability.new(user).can?(action, resource)
    end

    def custom_actions?
      !custom_actions_proc.nil?
    end

    def custom_actions
      resource_admin_class.send(custom_actions_proc, resource)
    end

    def class_name
      resource_class.name
    end
  end
end
