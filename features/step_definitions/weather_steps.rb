Given(/^I am on the Google main page$/) do
  @home_page = WeatherPage.new
  @home_page.load
end

When(/^I type "([^"]*)" in the search field$/) do |website|
  @home_page.search_filed.set(website).send_keys :enter
end

And(/^I click on the first link$/) do
  find('span', text: 'GISMETEO: Погода в Україні, прогноз погоди на сьогодні ...').click
end

Then(/^I should see "([^"]*)"$/) do |website|
  expect(page).to have_content(website)
end

And(/^check if local town is "([^"]*)"$/) do |sity|
  expect(@home_page.city_block).to have_content(sity)
end

And(/^I debug$/) do
  binding.pry
end

And(/^browser sleep for "([^"]*)" seconds$/) do |seconds|
  sleep(seconds.to_i)
end