Feature: Quote
  In order to save money when buying a car
  As a user
  I should be able to obtain a detailed plaking Quote

Scenario Outline: Happy path for a Quote
  Given I have prepared a Quote for the city of <city>
  When I select the <vehicle_type> from "Vehicle"
    And I select the month <pdate> as "Plaking date"
    And I enter the <engine_information>
  Then I should see "Your Quote is <total_quote>"
    And I should see the separate value for each "<tasa_jefatura>,<tasa_colegio>,<ivtm>,<honorarios>,<iva>" line
  
Examples:
|   city   | vehicle_type |                    engine_information   |     pdate    | tasa_jefatura | tasa_colegio |    ivtm   |  honorarios  |  iva   | total_quote  |
|    VIC   |   Turismo    | {"Engine cc": "500", "Cylinders": "2"}  | "01-03-2012" |     $92.80    |    $5.14     |   $25.24  |   $150.00    | $32.58 |   $305.76    |
|   TONA   |  Ciclomotor  |   {"Engine cc": "", "Cylinders": ""}    | "01-09-2012" |     $25.60    |    $5.14     |    $4.42  |   $150.00    | $32.58 |   $217.74    |
| TERRASSA |  Motocicleta |   {"Engine cc": "250", "Cylinders": ""} | "01-05-2012" |     $92.80    |    $5.14     |   $11.36  |   $150.00    | $32.58 |   $291.88    |