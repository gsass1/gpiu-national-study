# frozen_string_literal: true

module MicrobiologicalInformation
  extend ActiveSupport::Concern

  included do
    has_one :appendix_microbiological_information, dependent: :destroy, as: :questionnaire
    accepts_nested_attributes_for :appendix_microbiological_information

    validates_associated :appendix_microbiological_information

    before_validation do
      self.appendix_microbiological_information ||= build_appendix_microbiological_information
    end
  end
end
