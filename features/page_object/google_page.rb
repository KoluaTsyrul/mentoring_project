class WeatherPage < SitePrism::Page
  set_url 'https://www.google.com.ua/'

  element :search_filed, 'div > input.gsfi'
  element :city_block, "a.weather_current_link"
end