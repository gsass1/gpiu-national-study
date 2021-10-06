class Admin::Patient
  include AdminResource

  viewable_admin_table_fields :initial, :creator, :study_iteration, :department, :patient_type, :identification_state, :uti_state, :ssi_state, :biopsy_state, :biopsy_outcome_state
  editable_admin_fields :initial, :creator, :study_iteration, :patient_type
  admin_custom_actions :admin_actions

  def self.admin_actions(p)
    arr = [{
      name: "Open Include Form",
      color: :success,
      route: [:edit_patient_identification_path, p.id, p.patient_identification.id],
    }]

    if p.uti_ssi?
      if p.uti_form_needed?
        arr.push({
          name: "Open UTI Form",
          color: :info,
          route: [:edit_patient_uti_questionnaire_path, p.id, p.uti_questionnaire.id],
        })
      end

      if p.ssi_form_needed?
        arr.push({
          name: "Open SSI Form",
          color: :info,
          route: [:edit_patient_ssi_questionnaire_path, p.id, p.ssi_questionnaire.id],
        })
      end
    elsif p.prostate_biopsy?
      arr.push({
        name: "Open Biopsy Form",
        color: :info,
        route: [:edit_patient_biopsy_questionnaire_path, p.id, p.biopsy_questionnaire.id],
      })

      arr.push({
        name: "Open Biopsy Outcome Form",
        color: :info,
        route: [:edit_patient_biopsy_outcome_questionnaire_path, p.id, p.biopsy_outcome_questionnaire.id],
      })
    end
    arr
  end
end
