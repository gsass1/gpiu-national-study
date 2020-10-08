class PatientIdentification < ApplicationRecord
  include AdminResource
  include Discard::Model
  include Questionnaire

  viewable_admin_table_fields :patient
  editable_admin_fields :patient

  enum sex: [:male, :female]
  enum admission_infection: [:home, :nursing, :other_hospital]
  enum infection_type: [:uti, :ssi, :both]

  with_options unless: :new_record? do |edit|
    edit.validates :birth_year, presence: true
    edit.validates :sex, presence: true
    edit.validates :pregnancy, inclusion: { in: [true, false] }, if: Proc.new { |f| f.female? }
    edit.validates :admission_date, presence: true
    edit.validate :admission_date_is_in_past
    edit.validates :evidence_infection, inclusion: { in: [true, false] }
    edit.validates :admission_infection, presence: true, if: Proc.new { |f| f.evidence_infection? }
    edit.validates :infection_type, presence: true
  end

  def to_s
    "Include Form #{patient}"
  end

  private
  def admission_date_is_in_past 
    if self.admission_date > Date.today
      errors.add(:admission_date, "cannot be in future.")
    end
  end
end
