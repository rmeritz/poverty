Feature: Entering a Salary 
  Scenario: Not living in poverty
    When I go to the homepage
    And I submit a salary of $20890/yr 
    Then I see that I'm not living in poverty
    And that I'm make $10000/yr more than those in poverty
    
  Scenario: Living in Poverty
    When I go to the homepage
    And I submit a tiny value
    Then I see that I'm livining in poverty

