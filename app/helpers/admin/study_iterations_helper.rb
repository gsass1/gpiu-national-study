module Admin::StudyIterationsHelper
  def collapse_panel(title, id, table, &block)
    content_tag :div, class: 'card mb-3' do
      concat (content_tag :div, class: 'card-header bg-primary text-light' do
        content_tag :strong do
          link_to title, "#collapse#{id}", class: 'admin_collapse_link', role: :button, data: { toggle: "collapse" }, aria: { expanded: false, controls: "collapse#{id}" }
        end
      end)

      concat (
        content_tag :div, id: "collapse#{id}", class: 'card-body collapse', style: (table ? "padding:0;" : "") do
          yield block
        end
      )
    end
  end

  def admin_study_iteration_nav_link(tab)
    link_to admin_study_iteration_path(@study_iteration, tab: tab), class: "nav-link #{"active" if @tab == tab}" do
      tab.capitalize
    end
  end
end
