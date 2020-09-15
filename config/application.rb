require_relative "boot"

require "rails/all"
require "view_component/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Life
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults(6.0)

    config.time_zone = "Central Time (US & Canada)"

    # ==========================================================================
    # Autoloading
    # ==========================================================================

    # See:
    #
    # - [Autoloading and Reloading Constants (Zeitwerk Mode)](https://edgeguides.rubyonrails.org/autoloading_and_reloading_constants.html)
    # - [Autoloading and Reloading Constants (Classic Mode)](https://edgeguides.rubyonrails.org/autoloading_and_reloading_constants_classic_mode.html)
    # - [zeitwork](https://github.com/fxn/zeitwerk)
    # - [Rails 5 disables autoloading while app in production](https://blog.bigbinary.com/2016/08/29/rails-5-disables-autoloading-after-booting-the-app-in-production.html)
    config.autoloader = :zeitwerk

    # When set to `false`, code is reloaded between requests.
    #
    # In the development environment your application's code is reloaded on
    # every request. This slows down response time but is perfect for development
    # since you don't have to restart the web server when you make code changes.
    config.cache_classes = false

    # Eager load code on boot. This eager loads most of Rails and
    # your application in memory, allowing both threaded web servers
    # and those relying on copy on write to perform better.
    # Rake tasks automatically ignore this option for performance.
    config.eager_load = true

    # ==========================================================================
    # Misc.
    # ==========================================================================

    config.secret_key_base = Rails.application.credentials.dig(Rails.env.to_sym, :secret_key_base)
  end
end
