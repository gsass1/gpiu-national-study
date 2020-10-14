module DepartmentQuestionnairesHelper
  def sub_section(name, &block)
    content_tag :div, class: 'card mb-3' do
      (content_tag :div, class: "card-header bg-primary text-light" do
        content_tag :strong, name
      end) +
      (content_tag :div, class: "card-body" do
        yield
      end)
    end
  end
end
