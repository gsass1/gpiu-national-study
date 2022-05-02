# frozen_string_literal: true

module AppendixUrologicalRiskFactors
  module ExportFormat
    extend ActiveSupport::Concern

    included do
      exports_as do |e, p|
        e.value 'i', p.previous
        e.value 'ii', p.tract_obstruction
        if p.tract_obstruction
          e.prefix 'ii' do
            e.value 'a', p.bladder_outlet_obstruction

            e.value 'b.l', p.tract_obstruction_left
            e.export p.left_urinary_tract_obstruction, prefix: 'b.l' if p.tract_obstruction_left

            e.value 'b.r', p.tract_obstruction_right
            e.export p.right_urinary_tract_obstruction, prefix: 'b.r' if p.tract_obstruction_right
          end
        end

        e.value 'iii', p.urinarystones
        if p.urinarystones == 'yes'
          e.prefix 'iii' do
            e.value 'a', p.urinarystones_calyceal
            e.value 'b', p.urinarystones_renalpelvic
            e.value 'c', p.urinarystones_ureteral
            e.value 'd', p.urinarystones_bladder
          end
        end

        e.value 'iv', p.antibiotic_treatment
        if p.antibiotic_treatment == 'yes'
          e.prefix 'iv' do
            e.value 'a', p.antibiotic_treatment_type
            e.value 'a_specify', p.antibiotic_treatment_specify if p.antibiotic_treatment_type == 'other'

            e.export p.appendix_antibiotic, prefix: 'b'
          end
        end

        e.value 'v', p.hospitalisation
        e.value 'v.a', p.hospitalisation_specify if p.hospitalisation

        e.value 'vi', p.catheter
        if p.catheter == 'yes'
          e.prefix 'vi' do
            e.value 'a', p.catheter_urethral
            e.value 'b', p.catheter_suprapubic
            e.value 'c', p.catheter_ureteralstent
            e.value 'd', p.catheter_nephrostomy
            e.value 'e', p.catheter_others
            e.value 'e_specify', p.catheter_other_specify if p.catheter_others
          end

          e.value 'vii', p.catheterduration
        end
      end
    end
  end
end
