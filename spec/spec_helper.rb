require 'rspec'
require 'capybara/rspec'
require 'axe-rspec'
require 'webdrivers/chromedriver'

require 'middleman-autoprefixer'
require 'middleman-livereload'
require 'middleman-dotenv'
require 'middleman-core'
require 'middleman-core/rack'

middleman_app = ::Middleman::Application.new do
  set :root, File.expand_path(File.join(File.dirname(__FILE__), '../spec'))
  set :environment, :development
  set :show_exceptions, false
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[--headless --disable-gpu] },
    'goog:loggingPrefs': {
      browser: 'ALL'
    }
  )

  options = ::Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--window-size=1400,1400')

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities,
    options: options
  )
end

Capybara.server = :webrick
Capybara.default_driver = :headless_chrome
Capybara.app = ::Middleman::Rack.new(middleman_app).to_app
