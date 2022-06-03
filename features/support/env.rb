require 'capybara/cucumber'
require 'require_all'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'securerandom'
require 'site_prism'

require_all 'models'
require_all 'modules'
require_all 'page_objects/sections'
require_all 'page_objects/pages'

def chrome_options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
end

Before do
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
end

World(FeatureHelper)