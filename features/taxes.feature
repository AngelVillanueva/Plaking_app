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
    And I should see the new Tax in the list

@wip
Scenario: Invalid tax creation supplying invalid data

@wip
Scenario: Happy path to delete a Tax

@wip
Scenario: Happy path for Tax editing

@wip
Scenario: Invalid tax editing supplying invalid data