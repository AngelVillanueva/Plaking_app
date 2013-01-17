Feature: User authentication

Scenario: Happy path to Sign in
  Given I am in the Sign in page
  When I fill "a@b.com" in "Email"
  And I fill "foobar" in "Password"
  And I click "Sign in"
  Then I should see "Welcome, Angel"
  And I should not see the header "Sign in"
  And I should see the link "Sign out"
  And I should not see the link "Sign in"
  And I should see the link "My Account"
  And I should see "My Orders"
  
Scenario Outline: Incorrect Sign in
  Given I am in the Sign in page
  When I fill <email> in "Email"
  And I fill <password> in "Password"
  And I click "Sign in"
  Then I should see "Username or Password information was wrong"
  And I should see the header "Sign in"
  And I should see the link "Sign in"
  And I should not see the link "Sign out"
  And I should not see the link "My Account"
  
  Examples:
  |    email   | password |
  |     ""     |    ""    |
  |     ""     | "foobar" |
  |  "a@b.com" |    ""    |
  |   "Angek"  | "foobar" |
  | "a@ex.com" | "foobak" |
  |   "Angek"  | "foobak" |
  

Scenario: error message dissapears after next request
  Given I am in the Sign in page
  When I click "Sign in"
  And I follow the "Home" link
  Then I should not see "Username or Password information was wrong"
  
Scenario: Happy path to Sign out
  Given I am signed in
  When I follow the "Sign out" link
  Then I should see "4 simple steps"
  And I should see the link "Sign in"
  And I should not see the link "Sign out"
  
Scenario: Non Admin users do not have access to the admin menu
  Given I am a logged common user
  When I go to any page
  Then I should not see the link "Admin menu"
  #And I should not see the link "States management"
  And I should not see the links within the admin menu
  
Scenario: Just Admin users have access to the admin menu
  Given I am a logged Admin user
  When I go to any page
  Then I should see the link "Admin menu"
  And I should see the links within the admin menu