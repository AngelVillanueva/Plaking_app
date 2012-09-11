Feature: handling the Users resource

Scenario: Not signed_in users cannot access Users page
  Given I am not signed in
  When I am in the Users page
  Then I should see the header "Sign in"
  And I should see "Please, sign in"
  
Scenario: Happy path to the show user page
  Given I am signed in at the application
  And I am in the Users page
  When I follow the "See user" link 
  Then I should see the header "User page"
  And I should not see "Please, sign in"
  
Scenario: Happy path to the edit user page
  Given I am signed in at the application
  And I am in the Users page
  When I follow the "Edit user" link
  Then I should see the header "Edit User"
  And I should not see "Please, sign in"
  
Scenario: Not signed_in users cannot access Edit User page
  Given I am not signed in
  When I am in the Edit User page
  Then I should see the header "Sign in"
  And I should see "Please, sign in"
  
Scenario: each User can just be edited by himself
  Given I am signed in at the application
  When I try to edit a different user
  Then I should not see the header "Edit User"
  And I should see the header "Welcome to Matricula El Coche"
    
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