# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    recipient { create(:user) }
    actor { create(:user) }
    notifiable { create(:hospital) }
    action { 'hospitals.submission' }
  end
end
