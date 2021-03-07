Given(/^I open the file$/) do
  workbook = RubyXL::Parser.parse("/Users/mtsyr/Documents/mentoring-project/fixtures/Table 1.xlsx")
  binding.pry
end

And(/^Create new file$/) do
  workbook = RubyXL::Workbook.new
end