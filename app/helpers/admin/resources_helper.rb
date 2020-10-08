module Admin::ResourcesHelper
  def resource_action_path(resource, action = nil)
    if action == nil
      action = ""
    else
      action = "#{action}_"
    end

    resource_action_path_for_class(resource, @resource_class, action)
  end

  def resource_action_path_for_class(resource, resource_class, action)
    if admin_controller?
      send("#{action}admin_#{resource_class.name.underscore.downcase}_path", resource.id)
    else
      send("#{action}regional_admin_country_#{resource_class.name.underscore.downcase}_path", @country.iso_2, resource.id)
    end
  end

  def resource_form_input(f, field)
    if @resource_associations.include?(field)
      assoc = @resource.send(field)
      f.input (field.to_s + "_id").to_sym, collection: assoc.nil? ? nil : assoc.class.all, selected: (assoc.nil? ? nil : assoc), label_method: :to_s
    elsif @resource_class.try(field.to_s.pluralize.to_sym)
      f.input field, collection: @resource_class.send(field.to_s.pluralize.to_sym).keys
    else
      f.input field
    end
  end

  def resource_field_value(resource, field)
    if @resource_associations.include?(field)
      assoc = resource.send(field)
      link_to assoc, resource_action_path_for_class(assoc, assoc.class, "")
    else
      resource.send(field)
    end
  end

  def admin_controller?
    @prefix == 'admin'
  end
end
