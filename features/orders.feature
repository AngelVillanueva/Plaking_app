Feature: creating new Orders

Scenario Outline: Happy Path
  Given I am in the New Order page
  When I fill <fname> in "First name"
  And I fill <lname> in "Last name"
  And I fill <address> in "Address"
  And I fill <email> in "Email"
  And I fill <phone> in "Phone number"
  And I click "Create Order"
  Then I should see "Thanks for your Order"
  
Examples:
  |  fname   |    lname     |          address                   |            email         |        phone       |
  | "Angela" | "Villanueva" |        "Rambla Jujol, 15"          |    "test@example.com"    |     "902100100"    |
  | "Miguel" | "Pedrosa"    |       "Melrose Place, 90210"       |  "prueba@example.co.uk"  |      "967223776"   |
  | "Lolita" | "Jackson"    | "Avenida Diagonal 8ª planta 08006" |     "A.t@ejemplo.es"     |  "+34 93 3962038"  |