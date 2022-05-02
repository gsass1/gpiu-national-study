# frozen_string_literal: true

class PatientIdentification < ApplicationRecord
  include Discard::Model
  include Exportable
  include Questionnaire
  include SaveWithErrors

  enum sex: { male: 0, female: 1 }
  enum admission_infection: { home: 0, nursing: 1, other_hospital: 2 }
  enum infection_type: { uti: 0, ssi: 1, both: 2 }

  with_options unless: :new_record? do |edit|
    edit.validates :birth_year, presence: true
    edit.validates :sex, presence: true
    edit.validates :pregnancy, inclusion: { in: [true, false] }, if: proc { |f| f.female? }
    edit.validates :admission_date, presence: true, prior: true
    edit.validates :evidence_infection, inclusion: { in: [true, false] }
    edit.validates :admission_infection, presence: true, if: proc { |f| f.evidence_infection? }
    edit.validates :infection_type, presence: true
  end

  exports_as do |e, p|
    e.value 'i', p.birth_year
    e.value 'ii', p.sex
    e.value 'ii.a', p.pregnancy if p.female?
    e.value 'iii', p.admission_date
    e.value 'iv', p.evidence_infection
    e.value 'iv.a', p.admission_infection if p.evidence_infection
    e.value 'v', p.infection_type
  end

  def to_s
    "Patient Include Form #{patient}-#{study_iteration.name}"
  end

  before_save :sanitize_attributes

  private

  def sanitize_attributes
    self.pregnancy = nil unless female?

    self.admission_infection = nil unless evidence_infection?
  end
end
