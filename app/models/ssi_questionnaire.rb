class SsiQuestionnaire < UtiSsiQuestionnaire
  custom_questionnaire_state :ssi_state

  default_scope { where(form_type: :ssi) }

  after_initialize do
    self.form_type = :ssi
  end


  validates :previous, presence: true
  validates :tractobstruction, presence: true
  validates :treatment, presence: true
  validates :treatmentspecify, presence: true, if: Proc.new { |f| f.treatment }

  validates :hospitalisation, presence: true
  validates :catheterduration, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates :intervention_contamination, presence: true

  validates :clinicaldiagnosis, presence: true
  validates :clinicaldiagnosisspecify, presence: true, if: Proc.new { |f| f.clinicaldiagnosis == 'other' }

  validates :provennauti, presence: true
  validates :antibioticculture, presence: true
  validates :antimicrobial_treatment, presence: true
end
