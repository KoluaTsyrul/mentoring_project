Given(/^I open the file and row "([^"]*)" and column "([^"]*)"$/) do |row, column|
  @work_book = RubyXL::Parser.parse("/Users/mtsyr/Documents/mentoring-project/fixtures/Table 1.xlsx")
  @worksheet = @work_book[0]
  log @worksheet[row.to_i][column.to_i].value
end

And(/^Create new file$/) do
  work_book = RubyXL::Workbook.new
  work_sheet = work_book[0]
  work_sheet.add_cell(0, 0, 'Hello')
  work_book.save('/Users/mtsyr/Documents/mentoring-project/fixtures/Table 3.xlsx')
end

And(/^I add worksheet$/) do
  work_book = @work_book.add_worksheet('Sheet2')
  work_book
  @work_book.save
end

And(/^I add sell$/) do
  @worksheet.add_cell(4, 1, 'Petro')
  @work_book.save
end