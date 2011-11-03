Feature: Entering a Salary 
  Scenario: Not living in poverty
    When I go to the homepage
    And I submit a salary above the poverty line 
    Then I see that I'm not living in poverty
    
  Scenario: Living in Poverty
    When I go to the homepage
    And I submit a tiny value
    Then I see that I'm livining in poverty

