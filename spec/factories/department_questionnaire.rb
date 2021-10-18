FactoryBot.define do
  factory :department_questionnaire do
    department
    study_iteration { create(:study_iteration, country: department.hospital.country) }
  end
end
