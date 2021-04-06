Given(/^I am on the Google main page$/) do
  # driver = Selenium::WebDriver.for :firefox
  # driver.navigate.to 'https://www.google.com.ua/'
  @home_page = WeatherPage.new
  @home_page.load
end

When(/^I type "([^"]*)" in the search field and check title "([^"]*)"$/) do |website, title|
  @home_page.search_filed.set(website).send_keys :enter
  expect(page).to have_text(title)
end

And(/^I click on the link with text "([^"]*)"$/) do |text|
  find('h3', text: text).click
end

Then(/^I should see "([^"]*)" and check url "([^"]*)"$/) do |website, url|
  expect(page).to have_content(website)
  expect(current_url).to have_content(url)
end

And(/^check if local town is "([^"]*)"$/) do |city|
  expect(@home_page.city_block).to have_content(city)
end

def hello
  log "Hi!"
end

And(/^I debug$/) do
  binding.pry
end

And(/^browser sleep for "([^"]*)" seconds$/) do |seconds|
  sleep(seconds.to_i)
end

And(/^I create console error$/) do
  page.execute_script("console.error('Test error');")
end

And(/^I parse the page$/) do
  doc = Nokogiri::HTML(URI.open('https://nokogiri.org/tutorials/installing_nokogiri.html'))

  doc.css('h1').each do |link|
    log link.content
  end
end

And(/^I check console errors$/) do
  error = page.driver.browser.manage.logs.get(:browser)
  binding.pry
  log error
end


And(/^I open the new tab$/) do
  page.execute_script("window.open()")
end


And(/^I close current tab$/) do
  page.execute_script("window.close()")
end

And(/^I turn back to previous page$/) do
  page.go_back
end


And(/^I switch to browser window number ([1-9])$/) do |window|
  if window.to_i < 1 || window.to_i > 9
    fail(StandardError.new('Window number is out of range. Choose a window number between 1 and 9'))
  end
  window_num = window.to_i - 1
  page_location = page.windows[window_num]
  page.switch_to_window(page_location)
end