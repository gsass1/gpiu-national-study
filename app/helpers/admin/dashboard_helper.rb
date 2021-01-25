module Admin::DashboardHelper
  def sidepanel_sections
    [
      {
        name: "Dashboard",
        path: admin_dashboard_index_path,
        controller: "dashboard",
        icon: "home",
        subsections: []
      },
      study_iteration_sidepanel_section(),
      {
        name: "Support Requests",
        path: admin_support_requests_path,
        controller: "support_requests",
        icon: "help",
        subsections: [
          {
            name: "Show All",
            path: admin_support_requests_path,
            action: "index"
          },
        ]
      },
      sidepanel_crud_section("user", "people"),
      sidepanel_crud_section("patient", "accessibility"),
      sidepanel_crud_section("country", "language", false),
      sidepanel_crud_section("hospital", "local_hospital"),
      sidepanel_crud_section("department", "group_work", false),
    ]
  end

  def study_iteration_sidepanel_section
    subsections = Country.all.order(name: :asc).map { |c|
      {
        name: c.name,
        path: admin_study_iterations_path(country: c.iso_2),
        action: "index",
        filter: Proc.new { |f| params[:country] == c.iso_2 }
      }
    }

    subsections.push({
      name: "Show All",
      path: admin_study_iterations_path,
      action: "index",
      filter: Proc.new { |f| params[:country].blank? }
    })

    {
      name: "Study Iterations",
      path: admin_study_iterations_path,
      controller: "study_iterations",
      icon: "date_range",
      subsections: subsections
    }
  end

  def sidepanel_crud_section(name, icon, can_delete = true)
    subsections = [
        {
          name: "Show All",
          path: send("admin_#{name.underscore.pluralize}_path"),
          action: "index",
          filter: Proc.new { |f| params[:deleted] != "true" }
        },
        {
          name: "New",
          path: send("new_admin_#{name.underscore}_path"),
          action: "new"
        }]

    if can_delete
      subsections.append({
        name: "Deleted",
        path: send("admin_#{name.underscore.pluralize}_path", deleted: true),
        action: "index",
        filter: Proc.new { |f| params[:deleted] == "true" }
      })
    end

    {
      name: name.pluralize.capitalize,
      path: send("admin_#{name.underscore.pluralize}_path"),
      controller: name.underscore.pluralize,
      icon: icon,
      subsections: subsections
    }
  end
end
