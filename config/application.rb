require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Passport
  class Application < Rails::Application
    I18n.enforce_available_locales = true
    I18n.available_locales = [ :en, :cn ]
    config.i18n.default_locale = :en

    redis_file = Rails.root.join( 'config', 'settings.yml' )
    redis_url = if File.exists?( redis_file )
      YAML.load_file( redis_file )[ Rails.env ][ 'redis_url' ]
    else
      "redis://localhost:6379"
    end

    config.cache_store = :redis_store, redis_url
  end
end
