Feature: Entering a Salary
  Scenario: Not living in poverty
    When I go to the homepage
    And I submit a salary of $100000000/yr
    Then I see that I'm not living in poverty
    And I see how far above the poverty line I am

  Scenario: Living in Poverty
    When I go to the homepage
    And I submit a salary of $1/yr
    Then I see that I'm living in poverty
    And I see how far below the poverty line I am

 Scenario: Entering Nothing
    When I go to the homepage
    And I submit nothing
    Then I am still on the homepage
    And I see an error message for entering nothing


