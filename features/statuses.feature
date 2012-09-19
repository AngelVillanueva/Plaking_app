  Feature: Status management

Scenario: create a valid new Status
  Given I am a logged Admin user
    And I follow the "Status management" link
    And I follow the "New Status" link
    And I fill "Documentation sent" in "Name"
    And I click "Create Status"
  Then I should see "New Status added"
  And I should see the item "Documentation sent" in the list

Scenario: create a not valid new Status
  Given I am a logged Admin user
    And I follow the "Status management" link
    And I follow the "New Status" link
    And I click "Create Status"
  Then I should not see "New Status added"
  And I should see "Error saving the Status"
  And I should not see the header "List of Statuses"

Scenario: non Admin users cannot access Status management
  Given I am a logged common user
  When I go to the Statuses Admin Area
  Then I should not arrive to the "Statuses" page
    And I should not see the link "Status management"
  
Scenario: non logged users cannot access Status management
  Given I am not a logged user
  When I go to the Statuses Admin Area
  Then I should see "Please, sign in"
    And I should not see the link "Status management"