source 'http://ruby.taobao.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'haml-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn-rails'

# Authorization gem
gem 'cancan'

# OAuth 2 provider
gem 'doorkeeper'

# Provider the Rails I18n translations on the JavaScript
gem "i18n-js"

# General ruby templating with json, bson, xml, plist and msgpack support
gem 'rabl'
gem 'oj'

# A simple and straightforward settings solution
gem 'settingslogic'

# Variables in your JS
gem 'gon'

# Cache
gem 'redis-rails'
gem 'hiredis'
gem 'second_level_cache'

group :development do
  gem 'pry-rails'
  gem 'hirb'
  gem 'hirb-unicode'
  gem "spring-commands-rspec"
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'shoulda', require: false
  gem 'guard-rspec', require: false
  gem 'ffaker'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'email_spec'
  if RbConfig::CONFIG['target_os'] =~ /darwin/i
    gem 'rspec-nc'
    gem 'rspec-legacy_formatters', require: false
  end
end

