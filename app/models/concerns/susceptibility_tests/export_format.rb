# frozen_string_literal: true

module SusceptibilityTests
  module ExportFormat
    extend ActiveSupport::Concern

    included do
      exports_as do |e, p|
        e.value 'a', p.pathogen
        e.value 'a_specify', p.pathogen_specify if p.pathogen.in?(SusceptibilityTest::OTHER_PATHOGENS)
        e.value 'b', p.cfu

        alphabet = ('a'..'z').to_a
        SusceptibilityTest::SUSCEPTIBILITY_FIELDS.each_with_index do |field, field_index|
          e.value alphabet[field_index + 2].to_s, p.send(field[:field])

          if field.key?(:sub_fields)
            e.prefix alphabet[field_index + 2] do
              field[:sub_fields].each_with_index do |sub_field, sub_field_index|
                e.value (sub_field_index + 1).to_s, p.send(sub_field[:field])
                unless p.send(sub_field[:field]).nil?
                  e.value "#{sub_field_index + 1}_s",
                          p.send("#{sub_field[:field]}_s")
                end
              end
            end
          else
            e.value "#{alphabet[field_index + 2]}_s", p.send("#{field[:field]}_s") unless p.send(field[:field]).nil?
          end
        end
      end
    end
  end
end
