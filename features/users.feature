Feature: handling the Users resource

Scenario: Not signed_in users cannot access Users page
  Given I am not signed in
  When I am in the Users page
  Then I should see the header "Sign in"
  And I should see "Please, sign in"
  
Scenario: Not Admin users cannot access Users page
  Given I am a logged common user
  When I go to the Users page
  Then I should not arrive to the "Users" page
  
Scenario: Admin users can access Users page
  Given I am a logged Admin user
  When I go to the Users page
  Then the page title should be "Users"
    And I should see a list of all Users 
  
Scenario: Happy path to the show user page
  Given I am signed in at the application
  When I follow the "My Account" link
  Then I should see the header "User page"
  And I should not see "Please, sign in"
  
Scenario: each User can just be viewed by himself
  Given I am signed in at the application
  When I try to see a different user
  Then I should not see the header "User page for"
  And I should see "4 simple steps"
  
Scenario: Admin user can see everybody
  Given I am a logged Admin user
  When I try to see a different user
  Then I should see the header "User page for"
    And I should not see "4 simple steps"
  
Scenario: Happy path to the edit user page
  Given I am a logged Admin user
  And I am in the Users page
  When I follow the "Edit user" link
  Then I should see the header "Edit User"
  And I should not see "Please, sign in"
  
Scenario: Not signed_in users cannot access Edit User page
  Given I am not signed in
  When I am in the Edit User page
  Then I should see the header "Sign in"
  And I should see "Please, sign in"
  
Scenario: Not signed_in users are redirected to the protected page after signin in
  Given I am not signed in
  When I am in the Edit User page
  And I sign in at the application
  Then I should see the header "Edit User"
  And I should not see "Please, sign in"

Scenario: each User can just be edited by himself
  Given I am signed in at the application
  When I try to edit a different user
  Then I should not see the header "Edit User"
  And I should see "4 simple steps"
  
Scenario: Admin User can edit everybody
  Given I am a logged Admin user
  When I try to edit a different user
  Then I should see the header "Edit User"
    And I should not see "4 simple steps"
    
Scenario: Happy path for a user edit
  Given I am at the Edit my User page
  When I fill "Myname" in "Name"
  And I fill "Mypass" in "Password"
  And I fill "Mypass" in "Password confirmation"
  And I click "Update User"
  Then I should see "The User was updated successfully"
  And I should not see "Please, sign in"
  
Scenario: Error updating a user
  Given I am at the Edit my User page
  When I fill "Myname" in "Name"
  And I fill "Mypass" in "Password"
  And I click "Update User"
  Then I should see "Error saving the user"
  Then I should not see "The User was updated successfully"
  And the flash message should be gone if I left the page
  
Scenario: Happy path to the new user page
  Given I am in the New User page
  When I fill "Myname" in "Name"
  And I fill "My@email.com" in "Email"
  And I fill "Mypass" in "Password"
  And I fill "Mypass" in "Password confirmation"
  Then the "User" count should be increased by "1"
  And I should see "The new user was created successfully"
  And I should not see "Please, sign in"
  
Scenario: Error saving a new User
  Given I am in the New User page
  When I fill "Myname" in "Name"
  Then the "User" count should not be increased by "1"
  And I should not see "The new user was created successfully"
  And I should see "Error saving the user"
  And the flash message should be gone if I left the page