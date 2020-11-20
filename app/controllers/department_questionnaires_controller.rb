class DepartmentQuestionnairesController < ApplicationController
  include ActiveStudyIteration
  include Authenticated
  load_and_authorize_resource :department
  load_and_authorize_resource :hospital, through: :department, singleton: true
  load_and_authorize_resource

  add_breadcrumb I18n.t("application.nav.dashboard"), :dashboard_index_path
  add_breadcrumb I18n.t("patients.index.title"), :patients_path

  requires_active_study_iteration only: [:update]

  def edit
    add_breadcrumb I18n.t("department_questionnaires.edit.title")

    # Makes Rails validate all attributes again
    @department_questionnaire.valid?
  end

  def update
    add_breadcrumb I18n.t("department_questionnaires.edit.title")
    @department_questionnaire = @department.current_department_questionnaire

    @department_questionnaire.update(department_questionnaire_params)
    if @department_questionnaire.save_with_errors
      flash[:success] = 'Questionnaire successfully saved.'
    else
      flash[:danger] = 'Questionnaire update failed.'
    end

    render :edit
  end

  private
  def department_questionnaire_params
    params.require(:department_questionnaire).permit(*(questionnaire_params + antimicrobial_params))
  end

  def questionnaire_params
    [:hospital_beds, :hospital_type, :hospital_othertype, :department_beds, :department_admissions,
      :department_stay, :department_urinecultures, :patient_male, :patient_female, :patient_catagory1, :patient_catagory2, :patient_catagory3,
      :patient_opensurgery, :patient_endoscopic, :patient_laparoscopic, :patient_prostaticbiopsy, :patient_transurethral_closed, :patient_transurethral_open,
      :patient_intermittent, :patient_suprapubic, :patient_nephrostromy, :patient_ureteral, :patient_provenuti, :patient_suspecteduti, :patient_otherinfections,
      :patient_prophylaxis, :perioperative, :urinary, :nautireports, :pathogens, :resistance]
  end

  def antimicrobial_params
    arr = []
    (1..20).each do |group_idx|
      ([99] + (0..16).to_a).each do |idx|
        arr.append "b_#{group_idx}_#{idx}"
      end
    end
    arr
  end
end
