Feature: Extracting Data

  Scenario: No data ever entered
    When no data has ever been entered in the website
    When I go to the private CSV URL
    Then I expect the empty CSV