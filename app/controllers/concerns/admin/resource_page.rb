# frozen_string_literal: true

# NOTE(gian): This handles the CRUD logic for resources on BOTH admin control
# panels (super admin and regional)
#
# Either we do it like this, having it all in one module and having it be a bit
# dirty or all the code so both ACPs have their own ResourcePage module.
module Admin
  module ResourcePage
    extend ActiveSupport::Concern

    included do
      @resource_name ||= controller_name

      before_action :set_resource_class_presenter, :url_prefix, :add_breadcrumbs, :load_study_iterations
      before_action :resource_query, only: [:index]
    end

    def new
      add_breadcrumb 'New', "/#{@url_prefix}/#{@resource_name}/new"
      @resource = ResourcePresenter.new(resource: resource_class.new)
      respond_to do |format|
        format.html { render template: 'admin/resources/new' }
      end
    end

    def create
      @resource = resource_class.new(resource_params)
      authorize! :create, @resource
      if @resource.save
        flash[:success] = 'Resource was created.'
        redirect_back_dashboard
      else
        flash[:danger] = 'Failed to create resource.'
        respond_to do |format|
          @resource = ResourcePresenter.new(resource: @resource)
          format.html { render template: 'admin/resources/new' }
        end
      end
    end

    def index
      respond_to do |format|
        format.html do
          @resources = @resources.map { |r| ResourcePresenter.new(resource: r) }
          render template: 'admin/resources/index'
        end
        format.csv do
          csv_data = resource_class.as_csv_collection(
            resource_class.accessible_by(current_ability)
                          .includes(@class_presenter.all_associations)
          )
          send_data csv_data, filename: "#{resource_name.pluralize}.csv"
        end
      end
    end

    def show
      @resource = resource_class.accessible_by(current_ability).find(params[:id])
      authorize! :read, @resource

      add_breadcrumb @resource, "/#{@url_prefix}/#{@resource_name}/#{@resource.id}"

      respond_to do |format|
        format.html do
          @resource = ResourcePresenter.new(resource: @resource)
          render template: 'admin/resources/show'
        end
        format.csv do
          csv_data = resource_class.as_csv_collection([@resource])
          send_data csv_data, filename: "#{@resource}.csv"
        end
      end
    end

    def edit
      @resource = resource_class.accessible_by(current_ability).find(params[:id])
      authorize! :edit, @resource

      add_breadcrumb "Edit #{@resource}", "/#{@url_prefix}/#{@resource_name}/#{@resource.id}/edit"

      @resource = ResourcePresenter.new(resource: @resource)
      respond_to do |format|
        format.html { render template: 'admin/resources/edit' }
      end
    end

    def update
      @resource = resource_class.accessible_by(current_ability).find(params[:id])
      authorize! :update, @resource

      @resource.assign_attributes(resource_params)
      unless can?(:update, @resource)
        redirect_back_dashboard(alert: 'Unable to update resource because the change would cause you to have insufficient permissions to access it further.') and return
      end

      if @resource.save
        flash[:success] = 'Resource was updated.'
        redirect_back_dashboard
      else
        flash[:danger] = 'Failed to update resource.'
        respond_to do |format|
          format.html do
            @resource = ResourcePresenter.new(resource: @resource)
            render template: 'admin/resources/edit'
          end
        end
      end
    end

    # NOTE(gian): this is endpoint for both deleting and restoring because I'm
    # lazy. Change this later
    def destroy
      @resource = resource_class.accessible_by(current_ability).find(params[:id])
      authorize! :delete, @resource

      if @resource.discarded?
        @resource.undiscard!
        flash[:notice] = 'Resource was restored.'
      else
        @resource.discard!
        flash[:notice] = 'Resource was discarded.'
      end

      redirect_back_dashboard
    end

    def resource_name
      @resource_name ||= controller_name.remove('Admin::')
    end

    def resource_class
      @resource_class ||= resource_name.classify.constantize
    end

    def resource_admin_class
      "Admin::#{@resource_class.name}".constantize
    end

    private

    def resource_params
      params.require(resource_class.name.parameterize.underscore.to_sym)
            .permit(*@class_presenter.controller_params)
    end

    def prefix
      # NOTE(gian): Either 'admin' or 'regional_admin'
      @prefix ||= controller_path.split('/')[0]
    end

    def url_prefix
      @url_prefix ||= (prefix == 'admin' ? 'admin' : "regional_admin/#{@country.iso_2}")
    end

    def dashboard_path
      # NOTE(gian): Redirects to either one of the dashboards depending on the prefix
      if prefix == 'admin'
        admin_dashboard_index_path
      else
        regional_admin_country_dashboard_index_path(@country.iso_2)
      end
    end

    def redirect_back_dashboard(options = {})
      redirect_back fallback_location: dashboard_path, **options
    end

    def add_breadcrumbs
      add_breadcrumb 'Admin', dashboard_path
      add_breadcrumb resource_name.split('_').map(&:capitalize).join(' '), "/#{@url_prefix}/#{@resource_name}"
    end

    def resource_query
      @p = params[:page].to_i || 1
      @p = 1 if @p <= 0

      @order = params[:order] || 'asc'
      @sort = params[:sort] || 'id'
      @per = params[:per].to_i || 10

      @per = 10 if @per <= 0

      @resources = resource_class.accessible_by(current_ability)
                                 .includes(@class_presenter.all_associations)
                                 .order("#{@sort} #{@order}")

      @total_pages = (@resources.count / @per.to_f).ceil

      if params[:deleted]
        @resources = @resources.discarded if @resources.try(:discarded)
      elsif @resources.try(:kept)
        @resources = @resources.kept
      end

      @total_count = @resources.count

      if params[:per] == 'all'
        @p = 1
        @total_pages = 1
        @per = 'all'
      else
        @resources = @resources.offset((@p - 1) * @per).limit(@per)
      end
    end

    def load_study_iterations
      @study_iterations = current_user.country.study_iterations
    end

    def set_resource_class_presenter
      @class_presenter = ResourceClassPresenter.new(resource_class: resource_class)
    end
  end
end
