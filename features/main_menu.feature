@main
Feature: As an App user, I want to access the functions on the main menu

  Background:
    Given I am on Home screen
    And I press on menu icon

  Scenario: I open Favorite conversions screen from main menu
    When I select "Favorite conversions" from menu
    Then I land on "Favorite conversions" screen
    And I see message to select conversions as favorite

  Scenario: I open My conversions screen from main menu
    When I select "My conversions" from menu
    Then I land on "My conversions" screen
    And I see no personal conversion created yet

  Scenario: I open History screen from main menu
    When I select "History" from menu
    Then I land on "History" screen
    And I see no history right now