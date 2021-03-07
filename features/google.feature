@google
Feature: Use Google to find the weather website and open it

  Scenario Outline: Find and then open weather website
    Given I am on the Google main page
    And I check console errors
    And I debug
    When I type "Gismeteo" in the search field
    And I click on the first link
    Then I should see "Gismeteo"
    And I parse the page
    And check if local town is "<location>"
    And I create console error
    Examples:
      | location |
      | Івано-Франківськ |
      | Львів |