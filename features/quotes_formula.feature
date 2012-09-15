Feature: calculation of the rigth Quote

Scenario Outline: a Quote for a Car needs CC, Cylinders and Stroke data
  Given I have prepared a Quote for a <vehicle_type>
  When I create the Quote for <type> without <engine_field> data
  Then the Quote should not be valid
  
Examples:
  | vehicle_type |     type    | engine_field |
  |      car     |    Turismo  |  Cylinders   |
  |      car     |   Turismo   |   Engine cc  |
  |      moto    | Motocicleta |   Engine cc  |
