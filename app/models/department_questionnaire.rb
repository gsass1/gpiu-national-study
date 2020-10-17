class DepartmentQuestionnaire < ApplicationRecord
  include AdminResource
  include Discard::Model
  include QuestionnaireStates
  include SaveWithErrors
  include StudyIterationScoped

  belongs_to :department
  belongs_to :study_iteration

  has_many :patients, through: :department
  has_one :country, through: :department

  questionnaire_state :state
  enum hospital_type: [:university, :teaching, :district, :other]

  viewable_admin_table_fields :department, :study_iteration, :state
  editable_admin_fields :department, :study_iteration, :state
  admin_custom_actions :admin_actions

  def admin_actions
    [{
      name: "Open Questionnaire",
      color: :success,
      route: [:edit_hospital_department_department_questionnaire_path, self.department.hospital, self.department, self]
    }]
  end

  before_update :set_state

  with_options unless: :new_record? do |edit|
    # 2.
    edit.validates :hospital_beds, numericality: { greater_than_or_equal_to: 0}
    edit.validates :hospital_type, presence: true
    edit.validates :hospital_othertype, presence: true, if: Proc.new {|f| f.hospital_type == :other }

    # 3.
    edit.validates :department_beds, numericality: { greater_than_or_equal_to: 0}
    edit.validates :department_admissions, numericality: { greater_than_or_equal_to: 0}
    edit.validates :department_stay, numericality: { greater_than_or_equal_to: 0}
    edit.validates :department_urinecultures, numericality: { greater_than_or_equal_to: 0}

    # 4.
    edit.validates :patient_male, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_female, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_category1, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_category2, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_category3, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_opensurgery, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_endoscopic, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_laparoscopic, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_prostaticbiopsy, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_transurethral_closed, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_transurethral_open, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_intermittent, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_suprapubic, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_nephrostromy, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_ureteral, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_provenuti, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_suspecteduti, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_otherinfections, numericality: { greater_than_or_equal_to: 0}
    edit.validates :patient_prophylaxis, numericality: { greater_than_or_equal_to: 0}

    # 5
    edit.validates :perioperative, inclusion: { in: [true, false], message: 'Please select' }
    edit.validates :urinary, inclusion: { in: [true, false], message: 'Please select' }
    edit.validates :nautireports, inclusion: { in: [true, false], message: 'Please select' }
    edit.validates :pathogens, inclusion: { in: [true, false], message: 'Please select' }
    edit.validates :resistance, inclusion: { in: [true, false], message: 'Please select' }
  end

  def to_s
    "DQ #{self.department}-#{self.study_iteration.name}"
  end

  private
  def set_state
    self.state = errors.any? ? :invalid : :valid
  end
end
