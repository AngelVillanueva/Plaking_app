Feature: accessing PDFs

Scenario: Access authorization/mand pdf
  Given I am in the Order page
  When I follow the "download the attached documents" link
  Then I should see "%PDF-1.3"