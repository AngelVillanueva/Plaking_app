Feature: handling Orders

Scenario Outline: Happy Path for a New Order
  Given I am a logged common user
    And I have created a Quote
  When I go to the New Order page
    And I fill <fname> in "First name"
    And I fill <lname> in "Last name"
    And I fill <address> in "Address"
    And I fill <email> in "Email"
    And I fill <phone> in "Phone number"
    And I fill <shop> in "Shop"
    And I click "Create Order"
  Then I should see "Thanks for your Order"
  
Examples:
  |  fname   |    lname     |          address                   |            email         |        phone       |          shop            |
  | "Angela" | "Villanueva" |        "Rambla Jujol, 15"          |    "test@example.com"    |     "902100100"    |   "Concesionario Estu"   |
  | "Miguel" | "Pedrosa"    |       "Melrose Place, 90210"       |  "prueba@example.co.uk"  |      "967223776"   |   "Concesionario Pendo"  |
  | "Lolita" | "Jackson"    | "Avenida Diagonal 8ª planta 08006" |     "A.t@ejemplo.es"     |  "+34 93 3962038"  |    "Concesionario OK"    |
  
Scenario: error creating an Order
  Given I am a logged common user
    And I have created a Quote
  When I go to the New Order page
    And I click "Create Order"
  Then I should see "Error saving the order"
    And the page title should be "New Order"
    And the flash message should be gone if I left the page

Scenario: signup / in is needed to create an Order
  Given I am not a logged user
    And I have created a Quote
  When I go to the New Order page
  Then I cannot create an Order before signing up or in
  
Scenario: After signup I can create an Order
  Given I have been redirected to signup page before creating an Order
  When I create a valid User
  Then I am able to create a new Order
  
Scenario: After signing in I can create an Order
  Given I have already a valid account
    And I have been redirected to signup page before creating an Order
  When I sign in as a valid user
  Then I am able to create a new Order
  
Scenario: Happy path to My Account
  Given I am a logged common user
    And I have some orders in place
  When I follow the "My account" link
  Then I should see "My Orders"
    And I should see the item "Order #1" in the list
    And I should see the item "Order #2" in the list
    And I should see "Status: "
    
Scenario: Happy path to Orders page
  Given I am a logged Admin user
  When I follow the "Orders management" link
  Then the page title should be "Orders"
    And I should see a list of all Orders
  
Scenario: common users cannot access to Orders page
  Given I am a logged common user
  When I go to any page
  Then I should not see the link "Orders management"
    And I should not arrive to the "Orders" page
  
Scenario: Happy Path for Editing an Order
  Given I am in the Edit Order page
  When I select "Documentation sent" as "Status"
  And I click "Update Order"
  Then I should see "The order was updated with the new status"
  And I should see "The current status of your order is: Documentation sent"