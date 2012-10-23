Feature: handling Orders

Scenario Outline: Happy Path for a New Order
  Given I am a logged common user
    And I have created a Quote
  When I go to the New Order page
    And I select <owner> as "Owner"
    And I fill <reg_name> in "Registered name"
    And I fill <cif> in "CIF"
    And I fill <fname> in "First name"
    And I fill <lname> in "Last name"
    And I select <gender> as "Gender"
    And I fill <nif> in "Nif"
    And I fill <address> in "Address"
    And I fill <email> in "Email"
    And I fill <phone> in "Phone number"
    And I fill <shop> in "Shop"
    And I fill <salesm> in "Shop salesman"
    And I fill <s_phone> in "Shop phone"
    And I click "Create Order"
  Then I should see "Thanks for your Order"
  
Examples:
  |  owner   |reg_name|    cif    |   nif    |   gender  |fname| lname |     address     |     email      |    phone    |   shop   |  salesm   |   s_phone   |
  |"Personal"|   ""   |    ""     |"OOOOOOOT"|"Mrs., Ms."|"Ana"|"Abadí"|"Rambla Llí,15-2"|"un@example.com"| "902100100" |"Auto2000"|"Iñú Gómez"|"+34 9339620"|
  |"Business"|"Soc SL"|"B64862600"|"OOOOOOOT"|   "Mr."   |"Ivo"|"Gómez"|"Melros Place,1º"|"dos@exam.co.uk"| "967223776" |"Aut 2000"|"Ana Cañüs"| "902100100" |
  |"Personal"|   ""   |    ""     |"OOOOOOOT"|"Mrs., Ms."|"Eva"|"Pérez"|"Diagonal 8ª 3d."|"t.s@ejemplo.es"|"+34 9339620"|"Ñám?$5%-"|"Eva Ribás"| "902145199" |
  
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
    
Scenario: Happy path to a specific Order page
  Given I am a logged common user
    And I have some orders in place
  When I check the status of my orders
  Then I should be able to see any of the orders in detail
    And I should be able to change its status
  
Scenario: common users cannot access to Orders page
  Given I am a logged common user
  When I go to any page
  Then I should not see the link "Orders management"
    And I should not arrive to the "Orders" page
  
Scenario: Happy Path for a User to Edit an Order
  Given I am a logged common user
    And I have some orders in place
  When I check the status of my orders
    Then I should be able to edit any of the Orders
    
Scenario: Happy Path of Order edition
  Given I am in the Edit Order page
  When I select "Documentation sent" as "Status"
    And I click "Update Order"
  Then I should see "The order was updated with the new status"
  And I should see "The current status of your order is: Documentation sent"
  
Scenario: a not Admin user can just change the Order status within a few options
  Given I am a logged common user
  When I go to the Edit Order page
  Then my options to change the Order status should be very limited

Scenario: Admin user can change the Order status without restrictions
  Given I am a logged Admin user
  When I am in the Edit Order page
  Then my options to change the Order status should not be restricted
  
Scenario: a user cannot edit other user's order
  Given I am a logged common user
  When I try to edit the order of a different user
  Then I should be redirected to the home page

Scenario: a Admin user can edit any user's order
  Given I am a logged Admin user
  When I try to edit the order of a different user
  Then I should be able to edit that order