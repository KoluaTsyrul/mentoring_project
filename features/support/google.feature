Feature: Use Google to find the weather website and open it

  Scenario Outline: Find and then open weather website
    Given I am on the Google main page
    When I type "Gismeteo" in the search field
    And I click on the first link
    Then I should see "Gismeteo"
    And check if local town is "<location>"
    Examples:
      | location |
      | Івано-Франківськ |
      | Львів |

