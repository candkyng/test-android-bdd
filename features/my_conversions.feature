@custom
Feature: As an App user, I want to create and manage my conversions

  Background:
    Given I am on Home screen


  Scenario: I can create a custom conversion successfully
    When I press on menu icon
    Then I select "My conversions" from menu
    When I press on Create Your First Conversion button
    Then I enter "Weight2" as Conversion Name
    When I press on New Unit button
    Then I enter "Pound" as Name
    And I enter "lb" as Symbol
    And I enter "453.592" as Value
    And I press on checkmark on top right corner
    When I press on New Unit button
    Then I enter "Gram" as Name
    And I enter "g" as Symbol
    And I enter "1" as Value
    And I press on checkmark on top right corner
    And I press on OK button
    Then I see "Weight2" listed in My Conversions




