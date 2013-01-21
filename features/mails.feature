Feature: as a User I should be able to receive some mails in order to be updated about the process

Scenario: User and Admin users receives an email after successful order creation
  Given I am a logged common user
    And there is at least one Admin user registered
  When I create a valid order
  Then I should receive an email with the order summary
    And the Admin users should receive an email reporting the new order
@mail
Scenario: User receives an email to notify the order status changed
  Given I am a logged common user
    And there is at least one Admin user registered
  When I change the status of an Order
  Then I should receive an email with the new status
    And the Admin users should receive an email with the new status