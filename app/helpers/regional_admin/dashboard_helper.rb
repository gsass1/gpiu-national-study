# frozen_string_literal: true

module RegionalAdmin
  module DashboardHelper
    def regional_admin_sidepanel_sections
      [
        {
          name: 'Dashboard',
          path: regional_admin_country_dashboard_index_path(@country),
          controller: 'dashboard',
          icon: 'home',
          subsections: []
        },
        {
          name: 'Study Iterations',
          path: regional_admin_country_study_iterations_path(@country),
          controller: 'study_iterations',
          icon: 'date_range',
          subsections: [
            {
              name: 'Show All',
              path: regional_admin_country_study_iterations_path(@country),
              action: 'index'
            },
            {
              name: 'New',
              path: new_regional_admin_country_study_iteration_path(@country),
              action: 'new'
            }
          ]
        },
        regional_admin_sidepanel_crud_section('user', 'people'),
        # regional_admin_sidepanel_crud_section("patient", "accessibility"),
        # regional_admin_sidepanel_crud_section("country", "language", false),
        regional_admin_sidepanel_crud_section('hospital', 'local_hospital')
        # regional_admin_sidepanel_crud_section("department", "group_work", false)
      ]
    end

    def regional_admin_sidepanel_crud_section(name, icon, can_delete = true)
      subsections = [
        {
          name: 'Show All',
          path: send("regional_admin_country_#{name.underscore.pluralize}_path", @country),
          action: 'index',
          filter: proc { |_f| params[:deleted] != 'true' }
        },
        {
          name: 'New',
          path: send("new_regional_admin_country_#{name.underscore}_path", @country),
          action: 'new'
        }
      ]

      if can_delete
        subsections.append({
                             name: 'Deleted',
                             path: send("regional_admin_country_#{name.underscore.pluralize}_path", @country,
                                        deleted: true),
                             action: 'index',
                             filter: proc { |_f| params[:deleted] == 'true' }
                           })
      end

      {
        name: name.pluralize.capitalize,
        path: send("regional_admin_country_#{name.underscore.pluralize}_path", @country),
        controller: name.underscore.pluralize,
        icon: icon,
        subsections: subsections
      }
    end
  end
end
