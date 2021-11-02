# frozen_string_literal: true

module Admin
  class AddRoleForm
    include ActiveModel::Model

    attr_accessor :name, :resource_type, :resource, :user

    validates :name, presence: true

    with_options unless: proc { |f| f.resource.blank? } do
      validates :resource, presence: true, numericality: { only_integer: true }
      validates :resource_type, presence: true
      validate :resource_type_is_valid
      validate :resource_exists
    end

    def initialize(params = {})
      super(params)
    end

    def save
      return false if invalid?

      add_role_to_user
    rescue NameError, ActiveRecord::RecordNotFound
      false
    end

    private

    def add_role_to_user
      if resource.blank?
        user.add_role(name)
      else
        user.add_role(name, resource_object)
      end
    end

    def resource_type_class
      resource_type.constantize
    end

    def resource_type_is_valid
      resource_type_class
    rescue NameError
      errors.add(:resource_type, 'is not a valid resource type')
    end

    def resource_object
      resource_type_class.find(resource)
    end

    def resource_exists
      resource_object
    rescue ActiveRecord::RecordNotFound
      errors.add(:resource, 'does not exist')
    end
  end
end
