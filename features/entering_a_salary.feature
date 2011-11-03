Feature: Entering a Salary 
  Scenario: Not living in poverty
    When I go to the homepage
    And I submit a salary of $20890/yr 
    Then I see that I'm not living in poverty
    And that I make $10000/yr more than those in poverty
    
  Scenario: Living in Poverty
    When I go to the homepage
    And I submit a salary of $1/yr
    Then I see that I'm living in poverty
    And that I make $10889/yr below the poverty line

