require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SpreeBase
  class Application < Rails::Application

    config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      # Load application's view overrides
      Dir.glob(File.join(File.dirname(__FILE__), "../app/overrides/*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.time_zone='Dhaka'

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        address:              Rails.application.credentials.email[:address],
        port:                 587,
        domain:               Rails.application.credentials.email[:domain],
        user_name:            Rails.application.credentials.email[:username],
        password:             Rails.application.credentials.email[:password],
        authentication:       'plain',
        enable_starttls_auto: true }
  end
end
