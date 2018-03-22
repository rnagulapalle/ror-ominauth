require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.salesforce_app_id = '3MVG9CEn_O3jvv0wqwXWJkhXWAjLERgFpfidu7EZ1hcP2O69lQ7FqCxmhzO.55dZ0x7w26tIb5AwZbBsjp6Ru'
    config.salesforce_app_secret = '6817819258187093801'

    config.assets.compile = true
    config.assets.precompile =  ['*.js', '*.css', '*.css.erb'] 

    config.public_file_server.enabled = false

  end
end
