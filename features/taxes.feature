Feature: Tax management
  In order to reflect the Government policy in our application
  As an Admin user
  I should be able to manage taxes to be applied in the orders
  
Scenario: Happy path to create a new Tax
  Given I am a logged Admin user
  When I go to the Tax Admin Area
    And I follow the "New Tax" link
    And I supply all the tax data
  Then I should see "Tax successfully created"
    And I should see the new Tax cell in the table

Scenario: Invalid tax creation supplying invalid data
  Given I am a logged Admin user
  When I go to the Tax Admin Area
    And I follow the "New Tax" link
    But I do not supply all the tax data
  Then I should see "Error creating the new Tax"
    And I should not see the new Tax cell in the table
   
Scenario: just Admin users should access the tax creation area
  Given I am a logged common user
  When I go to create a new Tax
  Then I should be redirected to the home page

Scenario: Happy path to delete a Tax
  Given I am a logged Admin user
    And there is at least one tax created
  When I try to delete a tax
  Then I should see a deletion confirmation message

Scenario: Happy path for Tax editing
  Given I am a logged Admin user
    And there is at least one tax created
  When I try to edit a tax
  Then I should see a edition confirmation message
    And I should see the edited Tax cell in the table

Scenario: Invalid tax editing supplying invalid data
  Given I am a logged Admin user
    And there is at least one tax created
  When I try to edit a tax with wrong information
  Then I should see a edition error message
    And I should be back in the Edit Tax page