redis_url = ENV['GPIU_NATIONAL_REDIS_URL'] || 'localhost:6379'

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{redis_url}/0", namespace: "gpiu_national_sidekiq_#{Rails.env}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{redis_url}/0", namespace: "gpiu_national_sidekiq_#{Rails.env}" }
end
