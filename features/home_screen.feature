@home
Feature: As an App user, I want to be able to convert values using existing conversions

  Background:
    Given I am on Home screen

  @default
  Scenario: Default values on Home screen is "Foot" and "Centimeter"
    Then Left unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"

  @show_all
  Scenario: Show All button should be disabled at launched, enabled when number is pressed, disabled when Clear is pressed
    Then Show All button should be disabled
    When I type 1 in application keypad
    Then Show All button should be enabled
    When I type C in application keypad
    Then Show All button should be disabled

  @conversions
  Scenario Outline: Verify length conversions
    When Change Left unit picker to "<leftUnit>"
    And Change Right unit picker to "<rightUnit>"
    Then Left unit picker value should be "<leftUnit>"
    And Right unit picker value should be "<rightUnit>"
    When I type <target> in application keypad
    Then I should see result as <result>
    Examples:
      |leftUnit | rightUnit |target |result  |
      |Foot     | Centimeter|1      |30.48   |
      |Inch     | Centimeter|2      |5.08    |
      |Mile     | Kilometer |9.2    |14.806  |
      |Meter    | Foot      |101    |331.3648|

  @favourite
  Scenario: User able to add current conversion to Favorites list
    When I press on Add to Favorites icon
    Then I press on menu icon
    And I press on Favorite conversions
    Then I verify "Length" added to Favorite conversions list

  @search
  Scenario Outline: User is able to search for conversion
    When I press on search button
    And I enter "<searchText>" in search field
    And I press return button on soft keyboard
    Then I am on Home screen
    And I verify "<searchText>" is the current conversion
    And Left unit picker value should be "<leftUnit>"
    And Right unit picker value should be "<rightUnit>"
    Examples:
      | leftUnit    | rightUnit      | searchText |
      | Celsius     | Fahrenheit     | Temperature |
      | Atmosphere  | Bar           | Pressure    |

  @conversions
  Scenario: User is able to select a different conversion to convert values
    When I press on menu icon
    Then I select "Volume" from menu
    Then Change Right unit picker to "Cup"
    When I type 1 in application keypad
    Then I should see result as 15.1416

  @switch_unit
  Scenario: User is able to reverse the units in the conversion by clicking switch unit button
    When I press the switch unit button
    Then Left unit picker value should be "Centimeter"
    And Right unit picker value should be "Foot"