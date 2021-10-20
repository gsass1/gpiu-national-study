# frozen_string_literal: true

module Admin
  class Department
    include AdminResource

    viewable_admin_table_fields :name, :hospital
    editable_admin_fields :name, :hospital
    viewable_admin_associations :department_questionnaires
    admin_custom_actions :admin_actions

    def self.admin_actions(department)
      unless department.current_department_questionnaire.nil?
        [{
          name: 'Open Hospital Questionnaire',
          color: :success,
          route: [:edit_hospital_department_department_questionnaire_path, department.hospital, department,
                  department.current_department_questionnaire]
        }]
      end
    end
  end
end
