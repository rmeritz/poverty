Feature: Entering a Salary 
  Scenario: Not in the top 1%
    When I go to the homepage
    And I submit a small value
    Then I see that I'm not in the top one percent

