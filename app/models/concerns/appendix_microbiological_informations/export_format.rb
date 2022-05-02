# frozen_string_literal: true

module AppendixMicrobiologicalInformations
  module ExportFormat
    extend ActiveSupport::Concern

    included do
      exports_as do |e, p|
        e.value 'i', p.proven
        if p.proven == 'yes'
          e.prefix 'i' do
            e.value 'a', p.culture_tissue_urine
            e.export p.culture_result_urine, prefix: 'a' if p.culture_result_urine

            e.value 'b', p.culture_tissue_blood
            e.export p.culture_result_blood, prefix: 'b' if p.culture_result_blood

            e.value 'c', p.culture_tissue_swab
            e.export p.culture_result_swab, prefix: 'c' if p.culture_result_swab

            e.value 'd', p.culture_tissue_other
            if p.culture_tissue_other
              e.value 'd_specify', p.culture_tissue_other_specify
              e.export p.culture_result_other, prefix: 'd' if p.culture_result_other
            end
          end
        end

        e.value 'ii', p.culture_antibiotics
        e.export p.appendix_antibiotic, prefix: 'ii' if p.culture_antibiotics == 'yes'
      end
    end
  end
end
