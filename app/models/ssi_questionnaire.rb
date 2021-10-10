class SsiQuestionnaire < UtiSsiQuestionnaire
  include ValidateBoolean

  custom_questionnaire_state :ssi_state

  default_scope { where(form_type: :ssi) }

  after_initialize do
    self.form_type = :ssi
  end

  validates_boolean :previous
  validates_boolean :tractobstruction
  validates :tractobjstructionspecify, presence: true, if: Proc.new { |f| f.tractobstruction }

  validates_boolean :treatment
  validates :treatmentspecify, presence: true, if: Proc.new { |f| f.treatment }

  validates_boolean :hospitalisation
  validates :catheterduration, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates :intervention_contamination, presence: true

  validates :clinicaldiagnosis, presence: true
  validates :clinicaldiagnosisspecify, presence: true, if: Proc.new { |f| f.clinicaldiagnosis == 'other' }

  validates_boolean :provennauti
  validates :antibioticculture, presence: true
  validates :antimicrobial_treatment, presence: true
end
