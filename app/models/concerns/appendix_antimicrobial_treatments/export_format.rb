# frozen_string_literal: true

module AppendixAntimicrobialTreatments
  module ExportFormat
    extend ActiveSupport::Concern

    included do
      exports_as do |e, p|
        e.value 'i', p.treatment

        e.export p.appendix_antibiotic, prefix: 'ii' unless p.treatment == 'none'
      end
    end
  end
end
