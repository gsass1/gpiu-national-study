class BiopsyQuestionnaire < ApplicationRecord
  include AdminResource
  include Discard::Model
  include Questionnaire
  include SaveWithErrors
  include YesNoUnknown

  belongs_to :patient

  validate_yes_no_unknown :antibiotics_preceding_months
  validate_if_yes :antibiotics_preceding_months do |group|
    group.validates :antibiotics_dosage, presence: true
    group.validates :antibiotics_duration, presence: true, numericality: true
    group.validates :antibiotics_route, inclusion: {in: %w(oral iv im), message: 'please select'}
  end

  validate_yes_no_unknown :urogenital_infection_preceding_months
  validate_yes_no_unknown :urinary_catheter
  validate_yes_no_unknown :prostate_size_measured
  validate_yes_no_unknown :diabetes_mellitus
  validate_yes_no_unknown :psa
  validate_yes_no_unknown :repeated_biopsy
  validate_yes_no_unknown :preoperative_urine_examination
  validate_yes_no_unknown :preoperative_bowel_preparation
  validate_yes_no_unknown :antibiotic_prophylaxis
  validate_yes_no_unknown :biopsy_anesthesia
end
