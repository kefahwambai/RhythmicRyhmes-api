require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bl0gapi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # config.middleware.use ActionDispatch::Cookies

    # config.middleware.use ActionDispatch::Session::CookieStore, key: 'blogsession', expire_after: 10.minutes
    # config.action_controller.forgery_protection_origin_check = true
    # config.action_dispatch.cookies_same_site_protection = :none


    config.api_only = true
  end
end
