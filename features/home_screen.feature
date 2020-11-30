Feature: Tests for Home screen functionality

  Scenario: Default values on Home screen is "Foot" and "Centimeter"
    Given I am on Home screen
    Then Left unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"

  Scenario: Show All button should be enabled at launched
    Given I am on Home screen
    Then Show All button should be enabled
    When I press on Clear button
    Then Show All button should be disabled

  Scenario Outline: Verify conversion from Foot to Inch
    Given I am on Home screen
    When Change Left unit picker to "Foot"
    And Change Right unit picker to "Inch"
    Then Left unit picker value should be "Foot"
    And Right unit picker value should be "Inch"
    When I type <target> to target text field
    Then I should see result as <result>
    Examples:
      |target |result|
      |1  |12        |
      |2  |24        |
