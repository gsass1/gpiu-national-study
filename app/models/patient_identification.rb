class PatientIdentification < ApplicationRecord
  include Discard::Model
  include Questionnaire
  include SaveWithErrors

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
    "Patient Include Form #{self.patient}-#{self.study_iteration.name}"
  end

  before_save :sanitize_attributes

  private
  def admission_date_is_in_past 
    unless self.admission_date.nil?
      if self.admission_date > Date.today
        errors.add(:admission_date, "Patient cannot be admitted in the future")
      end
    end
  end

  def sanitize_attributes
    unless self.female?
      self.pregnancy = nil
    end

    unless self.evidence_infection?
      self.admission_infection = nil
    end
  end
end
