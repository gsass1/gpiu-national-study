class SsiQuestionnaire < UtiSsiQuestionnaire
  custom_questionnaire_state :ssi_state

  default_scope { where(form_type: :ssi) }

  after_initialize do
    self.form_type = :ssi
  end
end
