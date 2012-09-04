Feature: Checking the available States for the app

Scenario: Select an available State
  Given I am in the homepage
  When I select "Barcelona" as "Name"
  And I click "Check State"
  Then I should see "This State is covered"
  And I should not see "Sorry, this State is not covered"
  And I should see "New Quote for Barcelona State"
  
Scenario: Select a not available State
  Given I am in the homepage
  When I select "Albacete" as "Name"
  And I click "Check State"
  Then I should see "Sorry, this State is not covered"
  And I should not see "This State is covered"
  