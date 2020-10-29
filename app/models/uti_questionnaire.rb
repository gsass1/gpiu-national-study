class UtiQuestionnaire < UtiSsiQuestionnaire
  custom_questionnaire_state :uti_state

  default_scope { where(form_type: :uti) }

  after_initialize do
    self.form_type = :uti
  end
end
