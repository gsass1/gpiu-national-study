# frozen_string_literal: true

class UtiQuestionnaire < UtiSsiQuestionnaire
  include ValidateBoolean

  custom_questionnaire_state :uti_state

  default_scope { where(form_type: :uti) }

  after_initialize do
    self.form_type = :uti
  end

  validates_boolean :previous

  validates_boolean :tractobstruction
  validates :tractobjstructionspecify, presence: true, if: proc { |f| f.tractobstruction }

  validates_boolean :treatment
  validates :treatmentspecify, presence: true, if: proc { |f| f.treatment }

  validates_boolean :hospitalisation
  validates :catheterduration, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates :intervention_contamination, presence: true

  validates :clinicaldiagnosis, presence: true
  validates :clinicaldiagnosisspecify, presence: true, if: proc { |f| f.clinicaldiagnosis == 'other' }

  validates_boolean :provennauti
  validates :antibioticculture, presence: true
  validates :antimicrobial_treatment, presence: true

  validates_associated :first_appendix_antibiotic, if: proc { |f| f.antibioticculture == 'yes' }
  validates_associated :second_appendix_antibiotic, if: proc { |f| f.antimicrobial_treatment == 'yes' }
  validates_associated :appendix_culture_result

  private

  def first_appendix_antibiotic
    get_appendix_antibiotics_at(0)
  end

  def second_appendix_antibiotic
    get_appendix_antibiotics_at(1)
  end
end
