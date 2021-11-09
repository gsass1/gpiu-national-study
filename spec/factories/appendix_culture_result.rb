# frozen_string_literal: true

FactoryBot.define do
  factory :appendix_culture_result do
    pos_id { 0 }
    first_pathogen { 'E. coli' }
    first_pathogen_enter_cfu_ml { 1 }
    susceptibility_standard { 1 }
  end
end
