# frozen_string_literal: true

class AppendixClinicalDiagnosis < ApplicationRecord
  include Exportable
  include SaveWithErrors

  include AppendixClinicalDiagnoses::Sanitization
  include AppendixClinicalDiagnoses::Validation
  include AppendixClinicalDiagnoses::ExportFormat

  belongs_to :uti_ssi_history, optional: true

  delegate :patient, to: :uti_ssi_history
  delegate :uti_form_needed?, to: :patient
  delegate :ssi_form_needed?, to: :patient
end
