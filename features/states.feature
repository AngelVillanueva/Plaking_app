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
  Then I should see the header "States Admin Area"
  And I should see a list of States
  
Scenario: Non Admin users cannot manage States
  Given I am a logged common user
  When I go to the States Admin Area
  Then I should see "Welcome to Matricula El Coche"
  Then I should not see "States Admin Area"
  And I should not see a list of States
  
Scenario: Admin users can access State creation
  Given I am a logged Admin user
  When I go to the New State page
  Then I should see "Create new State"
  And I should see a form
  
Scenario: Non Admin users access State creation
  Given I am a logged common user
  When I go to the New State page
  Then I should see "Welcome to Matricula El Coche"
  Then I should not see "Create new State"
  
Scenario: Admin users can create new States
  Given I am a logged Admin user
  When I go to the New State page
  And I fill a valid information for a new State
  Then the "State" count should be increased by "1"
  And I should see "New State successfully created"
  
Scenario: Error saving a new State
  Given I am a logged Admin user
  When I go to the New State page
  And I fill an invalid information for a new State
  Then the "State" count should not be increased by "1"
  And I should see "Error saving the State"
  And I should not see "New State successfully created"
  
Scenario: Admin users can delete States
  Given I am a logged Admin user
  When I go to delete a State
  Then the "State" count should be decreased by "1"
  And I should see "State successfully deleted"
  
Scenario: Admin users can edit States
  Given I am a logged Admin user
  When I go to edit a State
  And I make a valid change for the State
  Then the State should reflect the change