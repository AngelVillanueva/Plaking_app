Feature: Quote Concept management
  In order to show the right Quote in our application
  As an Admin user
  I should be able to manage the Quote Concepts used to build up the Quote
  
Scenario: Happy path to create a new Quote Concept
  Given I am a logged Admin user
  When I go to the Quote Concepts Administration Area
    And I follow the "New Concept" link
    And I supply all the Concept data
  Then I should see "New Quote Concept added successfully"
    And I should see the new Quote Concept cell in the table

Scenario: Invalid Quote Concept creation supplying invalid data
  Given I am a logged Admin user
  When I go to the Quote Concepts Administration Area
    And I follow the "New Concept" link
    But I do not supply all the Concept data
  Then I should see "Error creating the new Quote Concept"
    And I should not see the new Quote Concept cell in the table
 
Scenario: just Admin users should access the Quote Concept creation area
  Given I am a logged common user
  When I go to create a new Quote Concept
  Then I should be redirected to the home page

Scenario: Happy path to delete a Quote Concept
  Given I am a logged Admin user
    And there is at least one Quote Concept created
  When I try to delete a Quote Concept
  Then I should see a concept deletion confirmation message

Scenario: just Admin users should access the Quote Concept deletion area
  Given I am a logged common user
  When I go to delete a Quote Concept
  Then I should be redirected to the home page

Scenario: Happy path for Quote Concept editing
  Given I am a logged Admin user
    And there is at least one Quote Concept created
  When I try to edit a Quote Concept
  Then I should see a concept edition confirmation message
    And I should see the edited Quote Concept cell in the table

Scenario: Invalid Quote Concept editing supplying invalid data
  Given I am a logged Admin user
    And there is at least one Quote Concept created
  When I try to edit a Quote Concept with wrong information
  Then I should see a concept edition error message
    And I should be back in the Edit Quote Concept page
  
Scenario: just Admin users should access the Quote Concept edition area
  Given I am a logged common user
  When I go to edit a Quote Concept
  Then I should be redirected to the home page