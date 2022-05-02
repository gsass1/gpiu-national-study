# frozen_string_literal: true

module AppendixAntimicrobialTreatments
  module Validation
    extend ActiveSupport::Concern

    included do
      validates :treatment, presence: true
    end
  end
end
