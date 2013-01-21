source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.11'
gem 'bootstrap-sass', '2.1.0.1'
gem 'bcrypt-ruby', '3.0.1'  # crypted passwords
gem 'jquery-rails', '2.0.2'
gem 'prawn_rails' # pdf creation
gem 'simple_form' # add gem 'country_select' if needed
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'
gem 'routing-filter' # to prepend locale to url; other uses (pagination, extension, uuid,...)
gem 'nifval' #nifcif validation
gem "paperclip", "~> 3.0"

# Locale app
# gem 'localeapp' # issues with pull-push in dev mode
 
group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.10.0'
  gem 'guard-rspec', '0.5.5'
  gem 'guard-cucumber'
  gem 'fast_seeder'
 end

group :development do
  gem 'annotate', '2.5.0'
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.4'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'rb-fsevent', '0.9.1', :require => false
  gem 'growl', '1.0.3'
  gem 'guard-spork', '0.3.2'
  gem 'spork', '0.9.0'
  gem 'cucumber-rails', '1.2.1', require: false
  gem 'database_cleaner', '0.7.0'
  gem 'factory_girl_rails', '1.4.0'
  gem 'email_spec'
end

group :production do
  gem 'pg', '0.12.2'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'