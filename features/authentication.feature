Feature: User authentication

Scenario: Happy path to Sign in
  Given I am in the Sign in page
  When I fill "a@ex.com" in "Email"
  And I fill "foobar" in "Password"
  And I click "Sign in"
  Then I should see "Welcome to the User area, Angel"
  And I should not see the header "Sign in"
  And I should see the link "Sign out"
  And I should not see the link "Sign in"
  
Scenario Outline: Incorrect Sign in
  Given I am in the Sign in page
  When I fill <email> in "Email"
  And I fill <password> in "Password"
  And I click "Sign in"
  Then I should see "Username or Password information was wrong"
  And I should see the header "Sign in"
  And I should see the link "Sign in"
  And I should not see the link "Sign out"
  
  Examples:
  |    email   | password |
  |     ""     |    ""    |
  |     ""     | "foobar" |
  | "a@ex.com" |    ""    |
  |   "Angek"  | "foobar" |
  | "a@ex.com" | "foobak" |
  |   "Angek"  | "foobak" |
  

Scenario: error message dissapears after next request
  Given I am in the Sign in page
  When I click "Sign in"
  And I follow the "Home" link
  Then I should not see "Username or Password information was wrong"