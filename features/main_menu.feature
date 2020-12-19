@main
Feature: As an App user, I want to access the functions on the main menu

  Background:
    Given I am on Home screen

  Scenario: When I tap on menu icon, I should see left side menu
    When I press on menu icon
    Then I should see left side menu

  Scenario: I should be able to open My conversions screen
    When I press on menu icon
    And I select "My conversions" from menu
    Then I land on My conversions screen
    And I see no personal conversion created yet