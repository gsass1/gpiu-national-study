module PatientsHelper
  def questionnaire_table_entry(text, link, valid, size)
    content_tag :td, class: (valid ? "patient-valid-bg" : "patient-invalid-bg"), style: "width: #{size}%;" do
      link_to link, class: "btn btn-sm btn-outline-primary" do
        if valid
          "#{text} ✓ (valid)"
        else
          "#{text} ✕ (invalid/missing)"
        end
      end
    end
  end

  def department_questionnaire_text(state)
    if state
      "#{t(".open_department_questionnaire")} ✓ (valid)"
    else
      "#{t(".open_department_questionnaire")} ✕ (invalid/missing)"
    end
  end
end
