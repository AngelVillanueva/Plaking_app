Feature: New Quote page

Scenario: new quote for Ciclomotor
  Given I am in the New Quote page
  When I select "Abrera" as "City"
  And I select "Ciclomotor" as "Vehicle"
  And I click "Create Quote"
  Then I should see "Your Quote is 199.99"
  
Scenario: new quote for Motocicleta
  Given I am in the New Quote page
  When I select "Abrera" as "City"
  And I select "Motocicleta" as "Vehicle"
  And I fill "125" in "Engine cc"
  And I fill "2" in "Cylinders"
  And I select "2" as "Stroke"
  And I click "Create Quote"
  Then I should see "Your Quote is 299.99"

Scenario: new quote for Turismo
  Given I am in the New Quote page
  When I select "Abrera" as "City"
  And I select "Turismo" as "Vehicle"
  And I fill "500" in "Engine cc"
  And I fill "4" in "Cylinders"
  And I select "4" as "Stroke"
  And I fill "31-01-2012" in "Plaking date"
  And I click "Create Quote"
  Then I should see "Your Quote is 599.99"