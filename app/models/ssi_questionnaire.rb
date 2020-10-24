class SsiQuestionnaire < UtiSsiQuestionnaire
  custom_questionnaire_state :ssi_state


  after_initialize do
    self.form_type = :ssi
  end
end
