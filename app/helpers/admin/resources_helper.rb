# frozen_string_literal: true

module Admin
  module ResourcesHelper
    def resource_action_path(resource, action = nil)
      action = if action.nil?
                 ''
               else
                 "#{action}_"
               end

      resource_action_path_for_class(resource, resource.resource_class, action)
    end

    def resource_action_path_for_class(resource, resource_class, action)
      if admin_controller?
        send("#{action}admin_#{resource_class.name.underscore.downcase}_path", resource.id)
      else
        send("#{action}regional_admin_country_#{resource_class.name.underscore.downcase}_path", current_country.iso_2,
             resource.id)
      end
    end

    def resource_index_path(resource_class)
      if admin_controller?
        send("admin_#{resource_class.name.pluralize.underscore.downcase}_path")
      else
        send("regional_admin_country_#{resource_class.name.pluralize.underscore.downcase}_path", current_country.iso_2)
      end
    end

    def resource_export_all_path(resource_class)
      "#{resource_index_path(resource_class)}.csv"
    end

    def resource_form_input(f, resource, field)
      if resource.class_presenter.all_associations.include?(field)
        collection = resource.field_association_collection(field)
        value = resource.field_value(field)

        f.input "#{field}_id".to_sym, collection: collection,
                                      selected: value.nil? ? nil : value.id, label_method: :to_s
      elsif resource.enum?(field)
        f.input field, collection: resource.class_presenter.enum_values(field)
      else
        f.input field
      end
    end

    def resource_field_value(resource, field)
      value = resource.field_value(field)
      if resource.association?(field)
        resource_association(value)
      else
        value
      end
    end

    # Try to link this associated model. If there is no link (e.g. there is
    # no path handler registered), then just spit out the raw value
    def resource_association(value)
      link_to value, resource_action_path(value)
    rescue StandardError
      value
    end

    def resource_custom_action_buttons(actions)
      return if actions.nil?

      content_tag :div do
        actions.collect do |action|
          concat resource_custom_action_button(action)
        end
      end
    end

    def resource_custom_action_button(action)
      url = send(*action[:route])
      color = action[:color].nil? ? 'primary' : action[:color]
      method = action[:method] || :get
      link_to(action[:name], url, class: "btn btn-#{color}", method: method)
    end

    def admin_controller?
      controller_path.start_with?('admin')
    end

    def resource_page_path(p, order = @order, sort = @sort, per = @per.to_s)
      if admin_controller?
        "/admin/#{@resource_class.name.underscore.downcase.pluralize}/?page=#{p}&per=#{per.downcase}&order=#{order}&sort=#{sort}"
      else
        "/regional_admin/#{@country.iso_2}/#{@resource_class.name.underscore.downcase.pluralize}/?page=#{p}&per=#{per.downcase}&order=#{order}&sort=#{sort}"
      end
    end

    def resource_table_header_link(field)
      if @sort == field.to_s
        if @order == 'asc'
          resource_page_path @p, 'desc', @sort
        else
          resource_page_path @p, 'asc', @sort
        end
      else
        resource_page_path @p, 'asc', field
      end
    end

    def resource_form(resource, url_prefix, method, &block)
      simple_form_for(resource.resource,
                      as: resource.class_name.downcase,
                      url: "/#{url_prefix}/#{resource.class_name.underscore.downcase.pluralize}/#{resource.id}",
                      html: { method: method },
                      wrapper: :horizontal_form, &block)
    end
  end
end
