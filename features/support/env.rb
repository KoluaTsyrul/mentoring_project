require 'capybara/cucumber'
require 'selenium-webdriver'
require 'pry'
require 'rspec'
require 'site_prism'
require 'sentry-ruby'
require 'nokogiri'
require 'open-uri'
require 'simplecov'
require 'rest-client'
require 'rubyXL'
require 'parallel'

SimpleCov.start

Capybara.register_driver :safari do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(loggingPrefs:{browser: 'ALL'})
  browser_options = ::Selenium::WebDriver::Chrome::Options.new()
  # browser_options.args << '--some_option' # add whatever browser args and other options you need (--headless, etc)
  Capybara::Selenium::Driver.new(browser: :safari)
end

# chrome = Selenium::WebDriver.for :chrome
# Selenium::WebDriver::Chrome::Service = "/Users/mtsyr/Downloads/chromedriver_mac64.zip"

