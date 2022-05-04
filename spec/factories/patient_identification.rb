# frozen_string_literal: true

FactoryBot.define do
  factory :patient_identification do
    patient
    birth_year { 2000 }
    sex { :male }
    evidence_infection { false }
    infection_type { :both }
    admission_date { Date.today }
  end
end
