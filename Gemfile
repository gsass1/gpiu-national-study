source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
gem 'rails-i18n'
gem 'http_accept_language'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Application Gems
gem 'devise'
gem 'cancancan'
gem 'discard'
gem 'simple_form'
gem 'config'

gem "rolify"

gem 'slim'
gem 'slim-rails'

gem 'kaminari'

gem 'identicon'
gem 'material_icons'
gem 'material_design_icons'

gem 'jquery-rails'

gem 'chartkick'
gem 'chartjs-ror'
gem 'redcarpet'

gem 'asciidoctor'
gem 'asciidoctor-rouge'
gem 'rouge'
gem 'rouge-rails'

gem 'breadcrumbs_on_rails'

gem 'flag-icons-rails'

gem 'sidekiq', '~>6.1'
gem 'redis-namespace'

gem 'wicked_pdf'
group :wk_binary do
  gem 'wkhtmltopdf-binary'
end

# Groups
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'sqlite3'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Dev Helpers
  gem 'rails-plantuml-generator', git: 'https://github.com/HappyKadaver/rails-plantuml-generator'

  #gem 'i18n-debug'
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'bullet'
  gem 'slack-notifier'

  gem 'pry'
  gem 'pry-rails'
  gem 'pry-doc'

  gem 'faker'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

group :production do
  # Use postgresql as the database for Active Record
  gem 'pg', '>= 0.18', '< 2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
