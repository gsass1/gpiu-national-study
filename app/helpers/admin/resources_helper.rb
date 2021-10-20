# frozen_string_literal: true

module Admin
  module ResourcesHelper
    def resource_admin_class
      "Admin::#{@resource_class.name}".constantize
    end

    def resource_action_path(resource, action = nil)
      action = if action.nil?
                 ''
               else
                 "#{action}_"
               end

      resource_action_path_for_class(resource, @resource_class, action)
    end

    def resource_action_path_for_class(resource, resource_class, action)
      if admin_controller?
        send("#{action}admin_#{resource_class.name.underscore.downcase}_path", resource.id)
      else
        send("#{action}regional_admin_country_#{resource_class.name.underscore.downcase}_path", @country.iso_2,
             resource.id)
      end
    end

    def resource_index_path(resource_class)
      if admin_controller?
        send("admin_#{resource_class.name.pluralize.underscore.downcase}_path")
      else
        send("regional_admin_country_#{resource_class.name.pluralize.underscore.downcase}_path", @country.iso_2id)
      end
    end

    def resource_form_input(f, field)
      if @resource_associations.include?(field)
        assoc = @resource.send(field)
        f.input "#{field}_id".to_sym, collection: assoc.nil? ? nil : assoc.class.all,
                                      selected: assoc.nil? ? nil : assoc.id, label_method: :to_s
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
          link_to assoc, resource_action_path_for_class(assoc, assoc.class, '')
        rescue StandardError
          assoc
        end
      else
        resource.send(field)
      end
    end

    def resource_association(assoc)
      link_to assoc, resource_action_path_for_class(assoc, assoc.class, '')
    rescue StandardError
      assoc
    end

    def resource_custom_actions(resource, resource_admin_class)
      actions = resource_admin_class.send(resource_admin_class.custom_actions_proc, resource)

      unless actions.nil?
        content_tag :div do
          actions.collect do |action|
            concat(link_to(action[:name], send(*action[:route]),
                           class: "btn btn-#{action[:color].nil? ? 'primary' : action[:color]}", method: action[:method] || :get))
          end
        end
      end
    end

    def admin_controller?
      @prefix == 'admin'
    end

    def resource_page_path(p, order = @order, sort = @sort, per = @per.to_s)
      if admin_controller?
        "/admin/#{@resource_class.name.underscore.downcase.pluralize}/?page=#{p}&per=#{per.downcase}&order=#{order}&sort=#{sort}"
      else
        "/regional_admin/#{@country.iso_2}/#{@resource_class.name.underscore.downcase.pluralize}/?page=#{p}&per=#{per.downcase}&order=#{order}&sort=#{sort}"
      end
    end

    def can_sort_by_field?(field)
      @resource_class.column_names.include? field.to_s
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

    def can_be_exported?(clazz)
      clazz.included_modules.include?(CsvCollection)
    end
  end
end
