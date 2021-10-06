# NOTE(gian): This handles the CRUD logic for resources on BOTH admin control
# panels (super admin and regional)
#
# Either we do it like this, having it all in one module and having it be a bit
# dirty or all the code so both ACPs have their own ResourcePage module.
module Admin::ResourcePage
  extend ActiveSupport::Concern

  included do
    @resource_name ||= self.controller_name

    before_action :link_prefix, :add_breadcrumbs, :load_study_iterations
  end

  def new
    add_breadcrumb "New", "/#{@link_prefix}/#{@resource_name}/new"
    @resource = resource_class.new
    # NOTE(gian): load resource associations
    resource_associations
    respond_to do |format|
      format.html { render template: "admin/resources/new" }
    end
  end

  def create
    @resource = resource_class.new(resource_params)
    authorize! :create, @resource
    if @resource.save
      flash[:success] = "Resource was created."
      redirect_back_dashboard
    else
      flash[:danger] = "Failed to create resource."
      respond_to do |format|
        format.html { render template: "admin/resources/new" }
      end
    end
  end

  def index
    resource_query
    respond_to do |format|
      format.html { render template: "admin/resources/index" }
      format.csv {
        csv_data = resource_class.as_csv_collection(resource_class.accessible_by(current_ability).includes(resource_associations))
        send_data csv_data, filename: resource_name.pluralize + ".csv"
      }
    end
  end

  def show
    resource_associations
    resource_class
    link_prefix
    @resource = resource_class.accessible_by(current_ability).find(params[:id])
    add_breadcrumb @resource, "/#{@link_prefix}/#{@resource_name}/#{@resource.id}"
    respond_to do |format|
      format.html { render template: "admin/resources/show" }
      format.csv {
        csv_data = resource_class.as_csv_collection([@resource])
        send_data csv_data, filename: @resource.to_s + ".csv"
      }
    end
  end

  def edit
    link_prefix
    @resource = resource_class.accessible_by(current_ability).find(params[:id])
    authorize! :edit, @resource
    # NOTE(gian): load resource associations
    resource_associations
    add_breadcrumb "Edit #{@resource}", "/#{@link_prefix}/#{@resource_name}/#{@resource.id}/edit"
    respond_to do |format|
      format.html { render template: "admin/resources/edit" }
    end
  end

  def update
    @resource = resource_class.accessible_by(current_ability).find(params[:id])
    authorize! :update, @resource
    if @resource.update_attributes(resource_params)
      flash[:success] = "Resource was updated."
      redirect_back_dashboard
    else
      flash[:danger] = "Failed to update resource."
      respond_to do |format|
        format.html { render template: "admin/resources/edit" }
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
      flash[:notice] = "Resource was restored."
    else
      @resource.discard!
      flash[:notice] = "Resource was discarded."
    end

    redirect_back_dashboard
  end

  def resource_name
    @resource_name ||= self.controller_name.remove('Admin::')
  end

  def resource_class
    @resource_class ||= resource_name.classify.constantize
  end

  def resource_admin_class
    "Admin::#{@resource_class.name}".constantize
  end

  private

  def resource_associations
    # NOTE(gian): Include all associations that are present in admin_table_fields
    # We do this by first getting all of the class' associations and then using & to remove every associations that is not in admin_table_fields
    @resource_associations ||= resource_class.reflect_on_all_associations.map(&:name) & resource_admin_class.table_fields
  end

  def resource_association_id_fields
    # NOTE(gian): all association fields need to be "renamed" to represent their ID
    resource_associations.map { |f| (f.to_s + "_id").to_sym }
  end

  def resource_fields_excluding_associations
    resource_admin__class.form_fields - resource_associations
  end

  def resource_params
    params.require(resource_class.name.parameterize.underscore.to_sym).permit(*(resource_fields_excluding_associations + resource_association_id_fields))
  end

  def prefix
    # NOTE(gian): Either 'admin' or 'regional_admin'
    @prefix ||= self.controller_path.split('/')[0]
  end

  def link_prefix
    @link_prefix ||= (prefix == "admin" ? "admin" : "regional_admin/#{@country.iso_2}")
  end

  def dashboard_path
    # NOTE(gian): Redirects to either one of the dashboards depending on the prefix
    if prefix == "admin"
      admin_dashboard_index_path
    else
      regional_admin_country_dashboard_index_path(@country.iso_2)
    end
  end

  def redirect_back_dashboard
    redirect_back fallback_location: dashboard_path
  end

  def add_breadcrumbs
    add_breadcrumb "Admin", dashboard_path
    add_breadcrumb resource_name.split('_').map(&:capitalize).join(' '), "/#{@link_prefix}/#{@resource_name}"
  end

  def resource_query
    @p = params[:page].to_i || 1
    if @p <= 0
      @p = 1
    end

    @order = params[:order] || 'asc'
    @sort = params[:sort] || 'id'
    @per = params[:per].to_i || 10

    if @per <= 0
      @per = 10
    end

    @resources = resource_class.accessible_by(current_ability).includes(resource_associations).order("#{@sort} #{@order}")

    @total_pages = (@resources.count / @per.to_f).ceil

    if params[:deleted]
      if @resources.try(:discarded)
        @resources = @resources.discarded
      end
    else
      if @resources.try(:kept)
        @resources = @resources.kept
      end
    end

    @total_count = @resources.count

    unless params[:per] == 'all'
      @resources = @resources.offset((@p-1)*@per).limit(@per)
    else
      @p = 1
      @total_pages = 1
      @per = 'all'
    end
  end

  def load_study_iterations
    @study_iterations = current_user.country.study_iterations
  end
end
