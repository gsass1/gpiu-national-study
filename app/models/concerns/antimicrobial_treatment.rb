# frozen_string_literal: true

module AntimicrobialTreatment
  extend ActiveSupport::Concern

  included do
    has_one :appendix_antimicrobial_treatment, dependent: :destroy, as: :questionnaire
    accepts_nested_attributes_for :appendix_antimicrobial_treatment

    validates_associated :appendix_antimicrobial_treatment

    before_validation do
      self.appendix_antimicrobial_treatment ||= build_appendix_antimicrobial_treatment
    end
  end
end
