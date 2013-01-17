Feature: Static pages

Scenario: Accessing the About Us page
  Given I am not a logged user
  When I follow the "About us" link
  Then the page title should be "About us"

Scenario: Accessing the Contact Us page
  Given I am not a logged user
  When I follow the "Contact" link
  Then the page title should be "Contact us"

Scenario: Accessing the Legal Notice page
  Given I am not a logged user
  When I follow the "Legal notice" link
  Then the page title should be "Legal notice"