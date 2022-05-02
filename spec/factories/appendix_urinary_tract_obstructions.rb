# frozen_string_literal: true

FactoryBot.define do
  factory :appendix_urinary_tract_obstruction do
    appendix_urological_risk_factors { nil }
    lower { false }
    middle { false }
    upper { false }
    ureteropelvic_junction { false }
  end
end
