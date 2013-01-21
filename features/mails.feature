Feature: as a User I should be able to receive some mails in order to be updated about the process
@mail
Scenario: User receives an email after successful order creation
  Given I am a logged common user
  When I create a valid order
  Then I should receive an email with the order summary