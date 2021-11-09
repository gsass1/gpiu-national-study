# frozen_string_literal: true

module PatientsHelper
  def questionnaire_table_entry(patient, text, link, valid, size)
    if can?(:edit, patient)
      content_tag :td, class: (valid ? 'patient-valid-bg' : 'patient-invalid-bg'), style: "width: #{size}%;" do
        link_to link, class: 'btn btn-sm btn-outline-primary' do
          if valid
            "#{text} ✓ (valid)"
          else
            "#{text} ✕ (invalid/missing)"
          end
        end
      end
    else
      content_tag :td, class: (valid ? 'patient-valid-bg' : 'patient-invalid-bg'), style: "width: #{size}%;" do
        content_tag :button, class: 'btn btn-sm btn-outline-primary', disabled: 'disabled' do
          if valid
            "#{text} ✓ (valid)"
          else
            "#{text} ✕ (invalid/missing)"
          end
        end
      end
    end
  end

  def department_questionnaire_text(state)
    if state
      "#{t('.open_department_questionnaire')} ✓ (valid)"
    else
      "#{t('.open_department_questionnaire')} ✕ (invalid/missing)"
    end
  end

  def patient_lock_button(patient)
    if can?(:edit, patient)
      link_to patient_toggle_lock_path(patient), method: :post,
                                                 id: "#{patient.locked? ? 'unlock' : 'lock'}-patient-#{patient.id}",
                                                 title: (patient.locked? ? t('patients.index.uti_ssi.table.unlock_patient') : t('patients.index.uti_ssi.table.lock_patient')) do
        content_tag :i, class: 'material-icons' do
          if patient.locked?
            'lock'
          else
            'lock_open'
          end
        end
      end
    else
      content_tag :i, class: 'material-icons text-muted' do
        if patient.locked?
          'lock'
        else
          'lock_open'
        end
      end
    end
  end
end
