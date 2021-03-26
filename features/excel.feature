@excel
Feature: Work with exel files

  Scenario: Open file
    When I open the file and row "2" and column "1"
    And I add worksheet
    And I add sell
    And Create new file
    And I debug