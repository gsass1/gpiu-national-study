# frozen_string_literal: true

class UtiQuestionnaire < UtiSsiQuestionnaire
  include AntimicrobialTreatment
  include MicrobiologicalInformation
  include ValidateBoolean

  custom_questionnaire_state :uti_state

  default_scope { where(form_type: :uti) }

  after_initialize do
    self.form_type = :uti
  end
end
