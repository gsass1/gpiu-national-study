module Admin::ResourcePage
  extend ActiveSupport::Concern

  included do
  end

  class_methods do
    def index
    end
  end

  def index
    @resources = resource_class.includes(resource_associations)
    respond_to do |format|
      format.html { render template: "admin/resources/index" }
    end
  end

  def show
    @resource = resource_class.find(params[:id])
    respond_to do |format|
      format.html { render template: "admin/resources/show" }
    end
  end

  private

  def resource_class
    @resource_class ||= self.controller_name.remove('Admin::').classify.constantize
  end

  def resource_associations
    # NOTE(gian): Include all associations that are present in admin_table_fields
    # We do this by first getting all of the class' associations and then using & to remove every associations that is not in admin_table_fields
    resource_class.reflect_on_all_associations.map(&:name) & resource_class.admin_table_fields
  end
end
