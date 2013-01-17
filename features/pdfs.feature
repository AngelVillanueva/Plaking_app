
Feature: accessing PDFs

Scenario: Access authorization/mand pdf
  Given I am in the Order page
  When I follow the "download the attached documents" link
  Then I should see "%PDF-1.3"
  
Scenario: Access authorization/mand/certif pdf if a Company
  Given I am in the Order page for a Company
  When I follow the "download the attached documents" link
  Then I should see "%PDF-1.4"