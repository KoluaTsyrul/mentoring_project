When(/^Open new window$/) do
  # @driver = Selenium::WebDriver.for :chrome

  @driver = Selenium::WebDriver.for :safari

  @driver.manage.window.maximize

  @driver.get 'http://demo.guru99.com/test/upload/'
end

And(/^Close window$/) do
  @driver.close;
end

And(/^I click on the element$/) do
  @driver.find_element(css:"input[value=\"Go!\"]").click
end


And(/^I work with alert$/) do
  @driver.switch_to.alert.accept
end

And(/^I get alert text$/) do
  alertMessage = @driver.switch_to.alert.text
  log alertMessage
end

And(/^Click on the link text$/) do
  @driver.find_element(link_text:"Flights").click
end

And(/^Click on the radio btn$/) do
  @driver.find_element(css:"name = servClass")[1].click
end

When(/^Open FB page$/) do
  @driver.get 'http://demo.guru99.com/test/facebook.html'
end

And(/^fill the field$/) do
  @driver.find_element(css: "input.inputtext").send_keys "Hello WebDriver!"
end

And(/^I fill pass$/) do
  @driver.find_element(css: "input.inputtext[tabindex=2]").send_keys "1111"
end

And(/^select checkbox$/) do
  check_box = @driver.find_element(css:"[type=\"checkbox\"]")
  i = 0
  loop do
    check_box.click
    i += 1
    log check_box.selected?
    if i == 2
      break
    end
  end
end

And(/^I select option from dropdown$/) do
  @browser.select_list(css: "[name=\"country\"]").select("ANDORRA")
end

And(/^click on the partial text$/) do
  @driver.find_element(partial_link_text:"here").click
end

And(/^check hover effect$/) do
  element = @driver.find_element(link_text:"Home")
  color_element = @driver.find_element(:xpath, "/html/body/div[2]/table/tbody/tr/td[1]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[1]/td[1]")
  color1 = color_element.style("background-color")
  log "Before hover:  #{color1}"
  @driver.action.move_to(element).perform
  color2 = color_element.style("background-color")
  log "After hover:  #{color2}"
end

And(/^upload the file$/) do
  path = "/Users/mtsyr/Downloads/milky-way-2695569_960_720.jpg"

  element = @driver.find_element(id: "uploadfile_0")
  element1 = @driver.find_element(id: "terms")
  element2 = @driver.find_element(css: "[name=send]")
  element.send_keys path
  element1.click
  element2.click
end

And(/^close web driver$/) do
  @driver.quit
end