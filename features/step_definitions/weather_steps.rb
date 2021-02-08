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

And(/^check if local town is "([^"]*)"$/) do |city|
  expect(@home_page.city_block).to have_content(city)
end

def hello
  puts "Hi!"
end

And(/^I debug$/) do
  binding.pry
end

And(/^browser sleep for "([^"]*)" seconds$/) do |seconds|
  sleep(seconds.to_i)
end

And(/^I create console error$/) do
  page.execute_script("console.error('Test');")
end

And(/^I parse the page$/) do
  # doc = Nokogiri::HTML(URI.open('https://nokogiri.org/tutorials/installing_nokogiri.html'))
  doc = Nokogiri::HTML(URI.open('https://www.gismeteo.ua/ua.html'))

  doc.css('h1').each do |link|
    log link.content
  end
end

Given(/^Get method$/) do
  @url = 'https://jsonplaceholder.typicode.com'
  response = Faraday.get "#{@url}/posts/1"
  log response.status
  log response.body
end

Then(/^Create post$/) do
  post = Faraday.post("https://jsonplaceholder.typicode.com/posts",
         '{
          "title": "test",
          "body"": "cucs",
          "userId": 1
      }',
        "Content-Type" => "application/json")
  log post.status
  log post.body
end

And(/^Update post$/) do
  faraday_put = Faraday.put(
    "#{@url}/posts/1",
    '{
       "id": 1,
      "title": "update",
      "body": "post",
      "userId": 1
    }',
    "Content-Type" => "application/json")
  log faraday_put.status
  log faraday_put.body
end

And(/^get all posts$/) do
  response = Faraday.get "#{@url}/posts/101"
  log response.status
  log response.body
end

And(/^delete post$/) do
  response = Faraday.delete "#{@url}/posts/1"
  log response.status
end