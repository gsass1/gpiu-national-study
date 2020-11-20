module PatientsHelper
  def questionnaire_table_entry(text, link, valid, size)
    content_tag :td, class: (valid ? "patient-valid-bg" : "patient-invalid-bg"), style: "width: #{size}%;" do
      link_to link, class: "btn btn-sm btn-outline-primary" do
        if valid
          "#{text} ✓"
        else
          "#{text} ✕"
        end
      end
    end
  end
end
