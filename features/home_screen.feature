@home_screen
Feature: Tests for Home screen functionality

  @default
  Scenario: Default values on Home screen is "Foot" and "Centimeter"
    Given I am on Home screen
    Then Left unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"


  Scenario: Show All button should be disabled at launched, enabled when number is pressed, disabled when Clear is pressed
    Given I am on Home screen
    Then Show All button should be disabled
    When I type 1 in application keypad
    Then Show All button should be enabled
    When I type C in application keypad
    Then Show All button should be disabled

  @conversions
  Scenario Outline: Verify conversion from Foot to Centimeter
    Given I am on Home screen
    When Change Left unit picker to "Foot"
    And Change Right unit picker to "Centimeter"
    Then Left unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"
    When I type <target> in application keypad
    Then I should see result as <result>
    Examples:
      |target |result  |
      |1    |30.48     |
      |2    |60.96     |
      |9.2  |280.416   |
      |101  | 3 078.48 |

  Scenario: User able to add current conversion to Favorites list
    Given I am on Home screen
    And "Length" is not added to Favorite
    Then I press on Add to Favorites icon
    When I press on menu icon
    And I press on Favorite conversions
    Then I verify "Length" added to Favorite conversions list

  Scenario Outline: User is able to search for conversion
    Given I am on Home screen
    When I press on search button
    And I enter <searchText> in search field
    And I press return button on soft keyboard
    Then I am on Home screen
    And I verify <searchText> is the current conversion
    And Left unit picker value should be <leftUnit>
    And Right unit picker value should be <rightUnit>
    Examples:
      | leftUnit    | rightUnit      | searchText |
      | "Celsius" | "Fahrenheit" | "Temperature" |
      | "Atmosphere" | "Bar"     | "Pressure"    |