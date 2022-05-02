# frozen_string_literal: true

class UtiSsiHistory < ApplicationRecord
  include Comorbidity
  include SaveWithErrors

  belongs_to :patient

  has_one :appendix_urological_risk_factor, dependent: :destroy
  accepts_nested_attributes_for :appendix_urological_risk_factor

  has_one :appendix_urological_intervention, dependent: :destroy
  accepts_nested_attributes_for :appendix_urological_intervention

  has_one :appendix_clinical_diagnosis, dependent: :destroy
  accepts_nested_attributes_for :appendix_clinical_diagnosis

  before_validation do
    self.appendix_urological_risk_factor ||= build_appendix_urological_risk_factor
    self.appendix_urological_intervention ||= build_appendix_urological_intervention
    self.appendix_clinical_diagnosis ||= build_appendix_clinical_diagnosis
  end

  validates_associated :appendix_comorbidity
  validates_associated :appendix_urological_risk_factor
  validates_associated :appendix_urological_intervention
  validates_associated :appendix_clinical_diagnosis

  delegate :uti_form_needed?, to: :patient
  delegate :ssi_form_needed?, to: :patient
  delegate :uti_and_ssi_form_needed?, to: :patient
end
