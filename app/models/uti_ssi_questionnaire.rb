# frozen_string_literal: true

class UtiSsiQuestionnaire < ApplicationRecord
  include Discard::Model
  include Questionnaire
  include SaveWithErrors

  belongs_to :patient
  has_one :uti_ssi_history, through: :patient
  accepts_nested_attributes_for :patient

  delegate :uti_form_needed?, to: :patient
  delegate :ssi_form_needed?, to: :patient

  validates_associated :uti_ssi_history

  enum form_type: { uti: 0, ssi: 1 }

  def appendix_antibiotics_count
    2
  end
end
