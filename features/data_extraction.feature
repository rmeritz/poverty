Feature: Extracting Data

  Scenario: No data ever entered
    Given that no data has ever been entered
    When I go to the private CSV URL
    Then I expect the empty CSV

  Scenario: Data entered
   Given the following data has been entered:
      | created_at           | amount | ip           | 
      | 2011-11-03T21:12:46Z | 1      | 192.168.0.10 |
      | 2011-12-03T21:12:46Z | 123123 | 192.168.0.11 | 
   When I go to the private CSV URL
   Then I see the following CSV:
      | created_at           | amount | ip           | 
      | 2011-11-03T21:12:46Z | 1      | 192.168.0.10 |
      | 2011-12-03T21:12:46Z | 123123 | 192.168.0.11 |

