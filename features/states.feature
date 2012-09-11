Feature: Checking the available States for the app

Scenario: Select an available State
  Given I am in the homepage
  When I select "Barcelona" as "state_name"
  And I click "Check State"
  Then I should see "This State is covered"
  And I should not see "Sorry, this State is not covered"
  And I should see "New Quote for Barcelona State"
  
Scenario: Select a not available State
  Given I am in the homepage
  When I select "Albacete" as "state_name"
  And I click "Check State"
  Then I should see "Sorry, this State is not covered"
  And I should not see "This State is covered"
  
Scenario: Admin users can manage States
  Given I am a logged Admin user
  When I go to the States Admin Area
  Then I should see "States Admin Area"
  And I should see a list of States
  
Scenario: Non Admin users cannot manage States
  Given I am a logged common user
  When I go to the States Admin Area
  Then I should see "Welcome to Matricula El Coche"
  Then I should not see "States Admin Area"
  And I should not see a list of States
  