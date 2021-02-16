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

SimpleCov.start

# def options
#   Selenium::WebDriver::Chrome::Options.new(args: %w[widow-size=1800,1000])
# end
# Capybara.default_driver = :selenium
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, {browser: :chrome, options: options })
# end

# @driver = Selenium::WebDriver.for :chrome