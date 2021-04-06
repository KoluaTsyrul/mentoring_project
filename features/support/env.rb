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

# set driver paths
geckodriver_cmd = "which geckodriver"
chromedriver_cmd = "which chromedriver"
edgedriver_cmd = "which msedgedriver"

browser_width, browser_height = 1920, 1080

browser = ENV['CUCUMBER_BROWSER'] || 'headless'
browser_size = ENV['BROWSER_SIZE']
remote_server = ENV['SELENIUM_REMOTE_URL']

# Browser Size Input Example: "1920,1080"
if browser_size
  browser_width, browser_height = browser_size.split(",").map {|s| s.strip.to_i}
end

Selenium::WebDriver::Firefox::Launcher.send(:remove_const, 'SOCKET_LOCK_TIMEOUT')
Selenium::WebDriver::Firefox::Launcher::SOCKET_LOCK_TIMEOUT = 120
Selenium::WebDriver::Service.send(:remove_const, 'SOCKET_LOCK_TIMEOUT')
Selenium::WebDriver::Service::SOCKET_LOCK_TIMEOUT = 120

Capybara.default_selector = :css
Capybara.run_server = false

if ['firefox', 'chrome', 'headless', 'safari', 'edge'].include?(browser)
  Capybara.register_driver :selenium do |app|
    case browser
    when 'firefox'
      geckodriver_path = `#{geckodriver_cmd}`.chomp
      Selenium::WebDriver::Firefox::Service.driver_path = "#{geckodriver_path}"
      profile = Selenium::WebDriver::Firefox::Profile.new
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.read_timeout = 120
      profile['plugin.state.addlive_v'] = 2
      opts = remote_server ? {browser: :remote, desired_capabilities: browser.to_sym, url: remote_server} : {browser: browser.to_sym}
    when 'chrome', 'headless'
      args = [
          "--use-fake-ui-for-media-stream",
          "--disable-infobars",
          "--disable-web-security",
          "--verbose",
          "--no-sandbox",
          "--disable-dev-shm-usage"
      ]

      args.push('--headless') if browser == 'headless'

      caps = Selenium::WebDriver::Remote::Capabilities.chrome(
          loggingPrefs: {browser: 'ALL'},
          "chromeOptions": { args: args },
          "goog:chromeOptions": { args: args }
      )

      opts = { browser: :chrome, desired_capabilities: caps }
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.read_timeout = 120
      chromedriver_path = `#{chromedriver_cmd}`.chomp
      Selenium::WebDriver::Chrome.driver_path = "#{chromedriver_path}"
    when 'edge'
      edgedriver_path = `#{edgedriver_cmd}`.chomp
      Selenium::WebDriver::Edge::Service.driver_path = "#{edgedriver_path}"
      profile = Selenium::WebDriver::Chrome::Profile.new
      caps = Selenium::WebDriver::Remote::Capabilities.chrome(
          loggingPrefs: {browser: 'ALL'},
      )
      opts = { browser: :edge, desired_capabilities: caps }
      # profile = Selenium::WebDriver::Edge::Profile.new
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.read_timeout = 120
    when 'safari'
      profile = Selenium::WebDriver::Chrome::Profile.new
      caps = Selenium::WebDriver::Remote::Capabilities.chrome(
          loggingPrefs: {browser: 'ALL'},
      )
      opts = { browser: :safari, desired_capabilities: caps }

      client = Selenium::WebDriver::Remote::Http::Default.new
      client.read_timeout = 120
    end
    Capybara::Selenium::Driver.new app, opts.merge(profile: profile, http_client: client)
  end
  Capybara.default_driver = :selenium
  Capybara.javascript_driver = :selenium
else
  raise "Browser #{ browser } is not defined in #{ __FILE__ }"
end

# Resize browser
unless browser == "headless"
  Capybara.current_session.driver.browser.manage.window
      .resize_to(browser_width, browser_height)
end
