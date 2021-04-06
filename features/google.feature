@google
Feature: Use Google to find the weather site and open it

  Scenario Outline: Find and then open weather website
    Given I am on the Google main page
    And I create console error
#    And I check console errors
    When I type "Gismeteo" in the search field and check title "GISMETEO: Погода в Україні, прогноз погоди на сьогодні ..."
    And I open the new tab
    And I switch to browser window number 2
    And I am on the Google main page
    And I type "Gismeteo" in the search field and check title "GISMETEO: Погода в Україні, прогноз погоди на сьогодні ..."
    And I turn back to previous page
    And I type "sinoptik" in the search field and check title "SINOPTIK: Погода в Івано-Франківську. Прогноз погоди ..."
    And I click on the link with text "SINOPTIK: Погода в Івано-Франківську. Прогноз погоди ..."
    Then I should see "Погода в Івано-Франківську" and check url "https://ua.sinoptik.ua/"
    And I close current tab
    And I switch to browser window number 1
    And I click on the link with text "GISMETEO: Погода в Україні, прогноз погоди на сьогодні ..."
    Then I should see "Gismeteo" and check url "https://www.gismeteo.ua/ua/"
    And I parse the page
    And check if local town is "<location>"
    Examples:
      | location |
      | Івано-Франківськ |
      | Львів |
