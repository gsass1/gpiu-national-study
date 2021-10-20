# frozen_string_literal: true

class BiopsyOutcomeQuestionnaire < ApplicationRecord
  include CultureResult
  include Discard::Model
  include Questionnaire
  include SaveWithErrors
  include YesNoUnknown

  belongs_to :patient

  validate_yes_no_unknown :histopathology_analysis
  validate_yes_no_unknown :histopathology_biopsy_material_change, if: proc { |f|
                                                                        f.histopathology_analysis == 'yes'
                                                                      }

  enum histopathology_biopsy_material_change_severity: { mild: 0, moderate: 1, severe: 2 }, _prefix: true
  validates :histopathology_biopsy_material_change_severity, presence: true, if: proc { |f|
                                                                                   f.histopathology_analysis == 'yes' && f.histopathology_biopsy_material_change == 'yes'
                                                                                 }

  validate_yes_no_unknown :outcome_analysis
  validates :outcome_analysis_form_control_visit, presence: true, if: proc { |f| f.outcome_analysis == 'yes' }

  validate_yes_no_unknown :physician_visit
  validate_yes_no_unknown :physician_visit_care_clinician, if: proc { |f| f.physician_visit == 'yes' }
  validate_yes_no_unknown :physician_visit_emergency_room, if: proc { |f| f.physician_visit == 'yes' }
  validate_yes_no_unknown :physician_visit_admission_hospital, if: proc { |f| f.physician_visit == 'yes' }
  validate_yes_no_unknown :physician_visit_urine_culture, if: proc { |f| f.physician_visit == 'yes' }

  validate_yes_no_unknown :physician_visit_crp, if: proc { |f| f.physician_visit == 'yes' }
  validates :physician_visit_crp_value, presence: true, numericality: { greater_than_or_equal_to: 0 }, if: proc { |f|
                                                                                                             f.physician_visit == 'yes' && f.physician_visit_crp == 'yes'
                                                                                                           }

  validate_yes_no_unknown :physician_visit_wbc_count, if: proc { |f| f.physician_visit == 'yes' }
  validates :physician_visit_wbc_value, presence: true, numericality: { greater_than_or_equal_to: 0 }, if: proc { |f|
                                                                                                             f.physician_visit == 'yes' && f.physician_visit_wbc_count == 'yes'
                                                                                                           }

  validate_yes_no_unknown :physician_visit_psa, if: proc { |f| f.physician_visit == 'yes' }
  validates :physician_visit_psa_value, presence: true, numericality: { greater_than_or_equal_to: 0 }, if: proc { |f|
                                                                                                             f.physician_visit == 'yes' && f.physician_visit_psa == 'yes'
                                                                                                           }

  validate_yes_no_unknown :outcome_analysis_urinary_tract_infection

  validate_yes_no_unknown :antibiotic_treatment

  with_options if: proc { |f| f.antibiotic_treatment == 'yes' } do
    validates :antibiotics_type, presence: true
    validates :antibiotics_dosage, presence: true
    validates :antibiotics_duration, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :antibiotics_route, presence: true
  end

  validates :outcome, presence: true
end
