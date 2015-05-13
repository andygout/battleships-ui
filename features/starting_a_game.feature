Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Registering
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"
    When I fill in "name" with "Dan"
    And I click "submit"
    Then I should see "Hello Dan"

  Scenario: Failing to register
    Given I am on the new game page
    When I don't fill in "name" with ""
    And I click "submit"
    Then I should see "What's your name?"