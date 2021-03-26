@google
Feature: Use Google to find the weather site and open it

  Scenario Outline: Find and then open weather website
    Given I am on the Google main page
    And I create console error
    And I check console errors
    When I type "Gismeteo" in the search field
    And I click on the first link
    Then I should see "Gismeteo"
    And I parse the page
    And check if local town is "<location>"
    Examples:
      | location |
      | Івано-Франківськ |
      | Львів |
