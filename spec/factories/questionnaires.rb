FactoryBot.define do
  factory :department_questionnaire do
    department
    study_iteration { create(:study_iteration, country: department.hospital.country) }
  end

  factory :uti_questionnaire do
    patient
  end
end
