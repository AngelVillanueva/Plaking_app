Feature: Static pages

Scenario: Accessing the AboutUs page
  Given I am not a logged user
  When I follow the "About us" link
  Then the page title should be "About us"