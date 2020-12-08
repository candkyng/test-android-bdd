Feature: As an App user, I want to create and manage my conversions

  Scenario: I can create a custom conversion successfully
    Given I am on Home screen
    When I press on menu icon
    Then I press on My conversions button
    Then I land on My conversions screen
    When I press on Create Your First Conversion button
    Then I enter "Weight" as Conversion Name
    When I press on New Unit button
    Then I enter "Pound" as Name
    And I enter "lb" as Symbol
    And I enter "1" as Value
    And I press on checkmark on top right corner
    When I press on New Unit button
    Then I enter "Gram" as Name
    And I enter "g" as Symbol
    And I enter "453.592" as Value
    And I press on checkmark on top right corner
    And I press on OK button
    Then I see "Weight" listed in My Conversions




