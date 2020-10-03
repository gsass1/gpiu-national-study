class PatientIdentification < ApplicationRecord
  include Discard::Model

  belongs_to :patient

  enum sex: [:male, :female]
  enum admission_infection: [:home, :nursing, :other_hospital]
  enum infection_type: [:uti, :ssi, :both]

  validates :birth_year, presence: true
  validates :sex, presence: true
  validates :pregnancy, presence: true
  validates :admission_date, presence: true
  validates :admission_infection, presence: true
  validates :infection_type, presence: true
end
