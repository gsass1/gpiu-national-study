class BiopsyOutcomeQuestionnaire < ApplicationRecord
  include AdminResource
  include CultureResult
  include Discard::Model
  include Questionnaire
  include SaveWithErrors
  include YesNoUnknown

  belongs_to :patient

  validate_yes_no_unknown :histopathology_analysis
  validate_yes_no_unknown :outcome_analysis
  validate_yes_no_unknown :physician_visit
  validate_yes_no_unknown :physician_visit_psa
  validate_yes_no_unknown :physician_visit_crp
  validate_yes_no_unknown :outcome_analysis_urinary_tract_infection
  validate_yes_no_unknown :physician_visit_urine_culture
  validate_yes_no_unknown :physician_visit_wbc_count
  validate_yes_no_unknown :antibiotic_treatment
end
