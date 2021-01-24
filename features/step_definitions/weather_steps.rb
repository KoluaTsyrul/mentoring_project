Given(/^I am on the Google main page$/) do
  visit 'https://www.google.com.ua/'
end

When(/^I type "([^"]*)" in the search field$/) do |website|
    find('div > input.gsfi').set(website).send_keys :enter
end

And(/^I click on the first link$/) do
  find('span', text: 'GISMETEO: Погода в Україні, прогноз погоди на сьогодні ...').click
end

Then(/^I should see "([^"]*)"$/) do |website|
  expect(page).to have_content(website)
end

And(/^check if local town is Ivano\-Frankivsk$/) do
  expect(page).to have_content('Івано-Франківськ')
end

And(/^I click on the search btn$/) do
  within("tfB0Bf") do
    find(".gsfi").click
  end
  sleep 10
end

And(/^I debug$/) do
  binding.pry
end