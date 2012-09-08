Feature: Status access

Scenario: create a valid new Status
When I am in the New Status Page
And I fill "Documentation sent" in "Name"
And I click "Create Status"
Then I should see "New Status added"
And I should see the item "Documentation sent" in the list

Scenario: create a not valid new Status
When I am in the New Status Page
And I click "Create Status"
Then I should not see "New Status added"
And I should see "Error saving the Status"
And I should not see the header "List of Statuses"