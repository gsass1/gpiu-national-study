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
      # FIXME(gian): "selected" doesn't select the right value from the collection anymore??
      f.input (field.to_s + "_id").to_sym, collection: assoc.nil? ? nil : assoc.class.all, selected: assoc, label_method: :to_s
    elsif !@resource_class.try(field.to_s.pluralize.to_sym).nil?
      f.input field, collection: @resource_class.send(field.to_s.pluralize.to_sym).keys
    else
      f.input field
    end
  end

  def resource_field_value(resource, field)
    if @resource_associations.include?(field)
      assoc = resource.send(field)
      begin
        link_to assoc, resource_action_path_for_class(assoc, assoc.class, "")
      rescue
        assoc
      end
    else
      resource.send(field)
    end
  end

  def resource_association(assoc)
    begin
      link_to assoc, resource_action_path_for_class(assoc, assoc.class, "")
    rescue
      assoc
    end
  end

  def resource_custom_actions(resource, resource_class)
    actions = resource.send(resource_class.admin_custom_actions_proc)

    unless actions.nil?
      content_tag :div do
        actions.collect do |action|
          concat(link_to action[:name], send(*action[:route]), class: "btn btn-#{action[:color].nil? ? "primary" : action[:color]}")
        end
      end
    end
  end

  def admin_controller?
    @prefix == 'admin'
  end

  def resource_page_path(p)
    if admin_controller?
      "/admin/#{@resource_class.name.underscore.downcase.pluralize}/?page=#{p}&per=#{@per}&order=#{@order}&sort=#{@sort}"
    else
      "/regional_admin/#{@country.iso_2}/#{@resource_class.name.underscore.downcase.pluralize}/?page=#{p}&per=#{@per}&order=#{@order}&sort=#{@sort}"
    end
  end
end
