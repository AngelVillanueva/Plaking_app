Feature: Quote calculation

Scenario Outline: a Quote needs CC, Cylinders and Stroke data depending on the vehicle
  Given I have prepared a Quote for the city of <city>
  When I create the Quote for <type> without <engine_field> data
  Then the Quote should not be valid
  
Examples:
  | city |     type    | engine_field |
  |  VIC |    Turismo  |  Cylinders   |
  |  VIC |   Turismo   |   Engine cc  |
  |  VIC | Motocicleta |   Engine cc  |

Scenario Outline: Happy path for a Quote
  Given I have prepared a Quote for the city of <city>
  When I select the <vehicle_type> from "Vehicle"
    And I select the date <pdate> as "Plaking date"
    And I enter the <engine_information>
  Then I should see "Your Quote is <quote>"
  
Examples:
|   city   | vehicle_type |                    engine_information                 |    quote   |     pdate    |
|    VIC   |   Turismo    | {"Engine cc": "500", "Cylinders": "2", "Stroke": "2"} |   25.24 €  | "10-03-2012" |
|   TONA   |  Ciclomotor  |   {"Engine cc": "", "Cylinders": "", "Stroke": ""}    |    4.42 €  | "10-09-2012" |
| TERRASSA |  Motocicleta |   {"Engine cc": "250", "Cylinders": "", "Stroke": ""} |   11.36 €  | "10-05-2012" | 