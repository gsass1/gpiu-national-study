class BiopsyOutcomeQuestionnaire < ApplicationRecord
  include AdminResource
  include CultureResult
  include Discard::Model
  include Questionnaire
  include SaveWithErrors
  include YesNoUnknown

  belongs_to :patient

  validate_yes_no_unknown :histopathology_analysis
  validate_yes_no_unknown :histopathology_biopsy_material_change, if: Proc.new { |f| f.histopathology_analysis == 'yes' }

  enum histopathology_biopsy_material_change_severity: [:mild, :moderate, :severe], _prefix: true
  validates :histopathology_biopsy_material_change_severity, presence: true, if: Proc.new { |f| f.histopathology_analysis == 'yes' && f.histopathology_biopsy_material_change == 'yes' }

  validate_yes_no_unknown :outcome_analysis
  validates :outcome_analysis_form_control_visit, presence: true, if: Proc.new { |f| f.outcome_analysis == 'yes' }

  validate_yes_no_unknown :physician_visit
  validate_yes_no_unknown :physician_visit_care_clinician, if: Proc.new { |f| f.physician_visit == 'yes' }
  validate_yes_no_unknown :physician_visit_emergency_room, if: Proc.new { |f| f.physician_visit == 'yes' }
  validate_yes_no_unknown :physician_visit_admission_hospital, if: Proc.new { |f| f.physician_visit == 'yes' }
  validate_yes_no_unknown :physician_visit_urine_culture, if: Proc.new { |f| f.physician_visit == 'yes' }

  validate_yes_no_unknown :physician_visit_crp, if: Proc.new { |f| f.physician_visit == 'yes' }
  validates :physician_visit_crp_value, presence: true, numericality: { greater_than_or_equal_to: 0 }, if: Proc.new { |f| f.physician_visit == 'yes' && f.physician_visit_crp == 'yes' }

  validate_yes_no_unknown :physician_visit_wbc_count, if: Proc.new { |f| f.physician_visit == 'yes' }
  validates :physician_visit_wbc_value, presence: true, numericality: { greater_than_or_equal_to: 0 }, if: Proc.new { |f| f.physician_visit == 'yes' && f.physician_visit_wbc_count == 'yes' }

  validate_yes_no_unknown :physician_visit_psa, if: Proc.new { |f| f.physician_visit == 'yes' }
  validates :physician_visit_psa_value, presence: true, numericality: { greater_than_or_equal_to: 0 }, if: Proc.new { |f| f.physician_visit == 'yes' && f.physician_visit_psa == 'yes' }

  validate_yes_no_unknown :outcome_analysis_urinary_tract_infection

  validate_yes_no_unknown :antibiotic_treatment
  
  with_options if: Proc.new { |f| f.antibiotic_treatment == 'yes' } do |v|
    v.validates :antibiotics_type, presence: true
    v.validates :antibiotics_dosage, presence: true
    v.validates :antibiotics_duration, presence: true, numericality: { greater_than_or_equal_to: 0 }
    v.validates :antibiotics_route, presence: true
  end

  validates :outcome, presence: true
end
