# frozen_string_literal: true

module Admin
  class RolesController < ApplicationController
    include AdminAuthenticated
    layout 'admin'

    before_action :set_user, :add_breadcrumbs
    before_action :load_roles, only: :index
    before_action :set_role, only: :destroy

    def index
      @new_role = AddRoleForm.new(user: @user)
    end

    def create
      @new_role = AddRoleForm.new(role_params.merge(user: @user))

      if @new_role.save
        redirect_to admin_user_roles_path(@user), notice: 'Added role'
      else
        flash[:alert] = 'Failed to add role'

        load_roles
        render :index
      end
    end

    def destroy
      if @role.destroy
        redirect_to admin_user_roles_path(@user), notice: "Removed role '#{@role.name}'"
      else
        redirect_to admin_user_roles_path(@user), danger: "Failed to remove role '#{@role.name}'"
      end
    end

    private

    def add_new_role_to_user
      if role_params[:resource].blank?
        @user.add_role role_params[:name]
      else
        resource_obj = role_params[:resource_type].constantize.find(role_params[:resource])
        @user.add_role role_params[:name], resource_obj
      end
    rescue NameError, ActiveRecord::RecordNotFound
      false
    end

    def set_user
      @user = ::User.find(params[:user_id])
    end

    def load_roles
      @roles = @user.roles.map { |r| RolePresenter.new(role: r) }
    end

    def add_breadcrumbs
      add_breadcrumb 'Admin', dashboard_index_path
      add_breadcrumb 'Users', admin_users_path
      add_breadcrumb @user, admin_user_path(@user)
      add_breadcrumb 'Roles'
    end

    def set_role
      @role = @user.roles.find(params[:id])
    end

    def role_params
      params.require(:admin_add_role_form).permit(:name, :resource_type, :resource)
    end
  end
end
