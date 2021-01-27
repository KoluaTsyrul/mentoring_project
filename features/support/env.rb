require 'capybara/cucumber'
require 'selenium-webdriver'
require 'pry'
require 'rspec'
require 'site_prism'

def options
  Selenium::WebDriver::Chrome::Options.new(args: %w[widow-size=1800,1000])
end
Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, {browser: :chrome, options: options })
end