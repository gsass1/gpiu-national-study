# frozen_string_literal: true

module Admin
  class RolePresenter
    attr_reader :role, :resource

    delegate :id, to: :role
    delegate :name, to: :role
    delegate :resource_type, to: :role

    def initialize(role:)
      @role = role
      @resource = ResourcePresenter.new(resource: role.resource) unless role.resource.nil?
    end

    def resource?
      !resource.nil?
    end
  end
end
