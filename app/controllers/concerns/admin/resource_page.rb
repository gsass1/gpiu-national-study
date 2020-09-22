module Admin::ResourcePage
  extend ActiveSupport::Concern

  included do
    @resource_name ||= self.controller_name.remove('Admin::')

    add_breadcrumb "Admin", :admin_dashboard_index_path
    add_breadcrumb @resource_name.capitalize, "/admin/#{@resource_name}"
  end

  class_methods do
  end

  def new
    add_breadcrumb "New", "/admin/#{@resource_name}/new"
    @resource = resource_class.new
    # NOTE(gian): load resource associations
    resource_associations
    respond_to do |format|
      format.html { render template: "admin/resources/new" }
    end
  end

  def create
    @resource = resource_class.new(resource_params)
    if @resource.save
      flash[:success] = "Resource was created."
      redirect_back fallback_location: admin_dashboard_index_path
    else
      flash[:danger] = "Failed to create resource."
      respond_to do |format|
        format.html { render template: "admin/resources/new" }
      end
    end
  end

  def index
    @resources = resource_class.accessible_by(current_ability).includes(resource_associations)
    if params[:deleted]
      @resources = @resources.discarded
    else
      @resources = @resources.kept
    end
    respond_to do |format|
      format.html { render template: "admin/resources/index" }
    end
  end

  def show
    @resource = resource_class.accessible_by(current_ability).find(params[:id])
    add_breadcrumb @resource, "/admin/#{@resource_name}/#{@resource.id}"
    respond_to do |format|
      format.html { render template: "admin/resources/show" }
    end
  end

  def edit
    @resource = resource_class.accessible_by(current_ability).find(params[:id])
    # NOTE(gian): load resource associations
    resource_associations
    add_breadcrumb "Edit #{@resource}", "/admin/#{@resource_name}/#{@resource.id}/edit"
    respond_to do |format|
      format.html { render template: "admin/resources/edit" }
    end
  end

  def update
    @resource = resource_class.accessible_by(current_ability).find(params[:id])
    if @resource.update_attributes(resource_params)
      flash[:success] = "Resource was updated."
      redirect_back fallback_location: admin_dashboard_index_path
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
    if @resource.discarded?
      @resource.undiscard!
      flash[:notice] = "Resource was restored."
    else
      @resource.discard!
      flash[:notice] = "Resource was discarded."
    end

    redirect_back fallback_location: admin_dashboard_index_path
  end

  def resource_name
    @resource_name ||= self.controller_name.remove('Admin::')
  end

  def resource_class
    @resource_class ||= resource_name.classify.constantize
  end

  private

  def resource_associations
    # NOTE(gian): Include all associations that are present in admin_table_fields
    # We do this by first getting all of the class' associations and then using & to remove every associations that is not in admin_table_fields
    @resource_associations ||= resource_class.reflect_on_all_associations.map(&:name) & resource_class.admin_table_fields
  end

  def resource_association_id_fields
    # NOTE(gian): all association fields need to be "renamed" to represent their ID
    resource_associations.map { |f| (f.to_s + "_id").to_sym }
  end

  def resource_fields_excluding_associations
    resource_class.admin_form_fields - resource_associations
  end

  def resource_params
    params.require(resource_class.name.parameterize.underscore.to_sym).permit(*(resource_fields_excluding_associations + resource_association_id_fields))
  end
end
