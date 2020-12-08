Feature: Tests for main menu


  Scenario: When I tap on menu icon, I should see left side menu
    Given I am on Home screen
    When I press on menu icon
    Then I should see left side menu

  Scenario: I should be able to open My conversions screen
    Given I am on Home screen
    When I press on menu icon
    And I press on My conversions button
    Then I land on My conversions screen
    And I see no personal conversion created yet