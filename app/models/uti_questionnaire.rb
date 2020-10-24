class UtiQuestionnaire < UtiSsiQuestionnaire
  custom_questionnaire_state :uti_state

  after_initialize do
    self.form_type = :uti
  end
end
