Feature: As the unit converter app user, I would like to be able to retrieve and delete any conversion from history

  Background:
    Given I am on Home screen

  Scenario: Conversion is added to history as I run a conversion
    Given I convert "Acceleration" "1" from "Standard Gravity" to "Meter per Second Squared"
    When I open History
    Then Conversion "Acceleration" ("Standard Gravity" to "Meter per Second Squared") is listed #1 in History

  Scenario: Conversion is added to the top of history as I run multiple conversions
    Given I convert "Length" "100" from "Foot" to "Centimeter"
    And I convert "Volume" "10" from "Quart" to "Liter"
    When I open History
    Then Conversion "Volume" ("Quart" to "Liter") is listed #1 in History
    And Conversion "Length" ("Foot" to "Centimeter") is listed #2 in History
    When I convert "Acceleration" "1" from "Standard Gravity" to "Meter per Second Squared"
    And I open History
    Then Conversion "Acceleration" ("Standard Gravity" to "Meter per Second Squared") is listed #1 in History
    And Conversion "Volume" ("Quart" to "Liter") is listed #2 in History
    And Conversion "Length" ("Foot" to "Centimeter") is listed #3 in History

  Scenario: I retrieve a conversion from the history list
    Given I convert "Length" "100" from "Foot" to "Centimeter"
    And I convert "Volume" "10" from "Quart" to "Liter"
    And I convert "Acceleration" "1" from "Standard Gravity" to "Meter per Second Squared"
    When I open History
    And I click on conversion "Volume" ("Quart" to "Liter") in the History
    Then I verify "Volume" is the current conversion
    And Left unit picker value should be "Quart"
    And Right unit picker value should be "Liter"
    And I should see source value "10"

  Scenario: I retrieve a custom conversion from history
    Given I create a new custom conversion Weight
    When I click on "Weight" in My Conversions
    Then Left unit picker value should be "<leftUnit>"
    And Right unit picker value should be "<rightUnit>"
    When I type 9 in application keypad
    Then I should see result as <result>
    Then Conversion "Weight" ("Foot" to "Centimeter") is listed #1 in History
    Then Left unit picker value should be "<leftUnit>"
    And Right unit picker value should be "<rightUnit>"
    And I should see source value "9"
    Then I should see result as <result>

  Scenario: I retrieve a conversion from history which requires scrolling
    When I run conversions "Length, ...." using default units
    When I click on conversion "Length" ("Foot" to "Centimeter") in the History
    Then I verify "Length" is the current conversion
    And Left unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"
    And I should see source value "1"

  Scenario: Conversion is added to history when I switch units in the same conversion
  Scenario: Conversion is moved to the top in history when I run the same conversion units using different values
  Scenario: I remove a conversion from history
  Scenario: I remove all conversions from history one by one
  Scenario: I clear all conversions from history
  Scenario: I cancel clear all action