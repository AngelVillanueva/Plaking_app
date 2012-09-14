Feature: Quote construction
@now
Scenario Outline: Happy Quote
  Given I am in the New Quote page
  When I select <city> as "City"
  And I select <vehicle> as "Vehicle"
  And I fill <cc> in "Engine cc"
  And I fill <cyls> in "Cylinders"
  And I select <strokes> as "Stroke"
  And I select the date <pdate> as "Plaking date"
  And I click "Create Quote"
  Then I should see "Your Quote is <list_price>"
  
Examples:
  |  city    |     vehicle   |    cc   |   cyls  | strokes |     pdate    |   list_price  |
  | "Abrera" | "Ciclomotor"  |    ""   |   ""    |   ""    | "10-03-2012" |    199.99 €   |
  | "Abrera" | "Motocicleta" | "125"   |   "2"   |   "2"   | "15-10-2012" |    75.00 €    |
  | "Abrera" | "Turismo"     | "500"   |   "4"   |   "4"   | "31-01-2012" |    599.99 €   |