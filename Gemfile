source 'https://rubygems.org'

gem 'rails', '3.2.10'
gem 'paperclip'
gem 'aws-sdk'
gem 'ckeditor'
gem 'simple_form'
gem 'ice_cube'
gem 'friendly_id'
gem 'yaml_db'
gem 'oauth'
gem 'stripe'
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'madmimi'
gem 'google_drive'

gem 'capistrano'
gem 'rvm-capistrano'

gem 'bootstrap-datepicker-rails', :require => 'bootstrap-datepicker-rails',
  :git => 'git://github.com/Nerian/bootstrap-datepicker-rails.git'

# gem 'exception_notification', :require => 'exception_notifier'

# gem 'will_paginate',  '~> 3.0.3'
# gem 'bootstrap-will_paginate', "~> 0.0.7"
gem "therubyracer", "~> 0.10.1", :platform => :ruby
# gem 'anjlab-bootstrap-rails', '>= 2.2', :require => 'bootstrap-rails'

group :development, :test do
  gem 'capistrano-unicorn'
  gem 'capistrano-nginx'
  gem 'capistrano-maintenance'
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', '1.2.0'
  gem 'spork', '0.9.2'
end

group :development do
  gem 'annotate', '2.5.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
  gem 'turbo-sprockets-rails3'
end

gem 'jquery-rails', '2.0.2'
gem 'jquery-ui-rails'
gem 'bootstrap-sass', '~> 2.2.2.0' 
# gem 'less-rails'

group :test do
  gem 'capybara', '1.1.2'
  gem 'rb-inotify', '0.8.8'
  gem 'libnotify', '0.5.9'
end

group :production do
  gem 'pg', '0.12.2'
  gem 'unicorn'
end
