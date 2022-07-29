# frozen_string_literal: true

require 'appium_lib'
require 'dotenv/load'
require 'capybara/cucumber'
require 'require_all'
require 'rest-client'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'securerandom'
require 'site_prism'
require 'yaml'

require_all 'models'
require_all 'modules'
require_all 'page_objects/sections'
require_all 'page_objects/pages'

def chrome_options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
end

Before('@selenium') do
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
end

at_exit do
  File.delete('user.json') if File.exist?('user.json')
end

def device
  device_list = YAML.load_file('/Users/db/repo/trainings/dt-2022/features/support/devices.yml')

  case ENV['DEVICE']
  when 'samsung'
    device_list['samsung']
  when 'emulator1'
    device_list['emulator1']
  when 'emulator2'
    device_list['emulator2']
  else
    puts 'Device is not specified using default one'
    device_list['emulator1']
  end
end

def appium_caps
  { caps: {
    deviceName: 'Emulator',
    platformName: 'Android',
    udid: device,
    app: '/Users/db/repo/trainings/LabCoat/app/build/outputs/apk/debug/app-debug.apk',
    appPackage: 'com.commit451.gitlab.debug',
    appActivity: 'com.commit451.gitlab.activity.LaunchActivity',
    newCommandTimeout: '3600'
  } }
end

Appium::Driver.new(appium_caps, true)
Appium.promote_appium_methods Object

Before('@appium') do
  $driver.start_driver
end

After('@appium') do
  sleep 3
  $driver.remove_app 'com.commit451.gitlab.debug'
  $driver.driver_quit
end

World(FeatureHelper, APIWrapper)
