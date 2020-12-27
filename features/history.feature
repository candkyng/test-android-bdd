@history_add
Feature: As the unit converter app user, I would like to be able to add and retrieve any conversion from history

  Background:
    Given I am on Home screen

  Scenario: Conversion is added to history as I run a conversion
    Given I convert "Acceleration" "1" from "Standard Gravity" to "Meter per Second Squared"
    When I open History
    Then Conversion "Acceleration" ("Standard Gravity" to "Meter per Second Squared") is listed #1 in History

  @regression
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

  @regression
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
    Given I open My conversions
    And I create a new custom conversion Weight2
    When I click on "Weight2" in My Conversions
    And I type 9 in application keypad
    Then I should see result as 4 082.328
    When I open History
    And I click on conversion "Weight2" ("Pound" to "Gram") in the History
    Then Left unit picker value should be "Pound"
    And Right unit picker value should be "Gram"
    And I should see source value "9"
    Then I should see result as 4 082.328

  Scenario: I retrieve a conversion from history which requires scrolling
    Given I run conversions "Length,Area,Volume,Weight,Force,Speed,Acceleration,Energy" using default units
    When I open History
    And I click on conversion "Length" ("Foot" to "Centimeter") in the History
    Then I verify "Length" is the current conversion
    And Left unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"
    And I should see source value "1"

  Scenario: Conversion is added to history when I switch units in the same conversion
    Given I convert "Length" "100" from "Foot" to "Centimeter"
    When I press the switch unit button
    And I open History
    Then Conversion "Length" ("Foot" to "Centimeter") is listed #2 in History
    And Conversion "Length" ("Centimeter" to "Foot") is listed #1 in History

