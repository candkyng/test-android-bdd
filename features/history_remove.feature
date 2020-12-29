@history_remove
Feature: As the unit converter app user, I would like to be able to delete any conversions from history

  Background: Setup the conversion history
    Given I convert "Length" "100" from "Foot" to "Centimeter"
    And I convert "Volume" "10" from "Quart" to "Liter"
    And I convert "Area" "1" from "Hectare" to "Are"

  Scenario Outline: I remove a conversion from history
    When I open History
    And I remove conversion "<conversion>" ("<leftUnit>" to "<rightUnit>") from History
    Then conversion "<conversion>" ("<leftUnit>" to "<rightUnit>") is not found in History
    Examples:
      |conversion|leftUnit|rightUnit|
      |Length    |Foot    |Centimeter|
      |Volume    |Quart   |Liter     |

  Scenario: I remove all conversions from history one by one
    When I open History
    And I remove conversion "Area" ("Hectare" to "Are") from History
    And  I remove conversion "Volume" ("Quart" to "Liter") from History
    And  I remove conversion "Length" ("Foot" to "Centimeter") from History
    Then I see no history right now

  Scenario: I clear all conversions from history
    When I open History
    And I press on Clear History button
    Then I see Delete history confirmation dialog
    When I press on DELETE on Delete history confirmation dialog
    Then I see no history right now

  Scenario: I cancel clear all action
    When I open History
    And I press on Clear History button
    Then I see Delete history confirmation dialog
    When I press on CANCEL on Delete history confirmation dialog
    Then Conversion "Area" ("Hectare" to "Are") is listed #1 in History
    And Conversion "Volume" ("Quart" to "Liter") is listed #2 in History
    And Conversion "Length" ("Foot" to "Centimeter") is listed #3 in History



