FactoryBot.define do
  factory :patient_identification do
    patient
    birth_year { 2000 }
    sex { :male }
    evidence_infection { false }
    infection_type { :both }
  end
end
