Feature: New Quote page

Scenario: new quote page after selecting an available State
  Given I am in the New Quote page
  When I select "Abrera" as "City"
  And I select "Ciclomotor" as "Vehicle"
  And I click "Create Quote"
  Then I should see "Your Quote is 199.99"