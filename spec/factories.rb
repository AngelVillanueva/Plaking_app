FactoryGirl.define do

  factory :state do
    name "Barcelona"
    covered true
    cp_prefix "08"
  end
  
  factory :state_not_covered, class: "State" do
    name "Albacete"
    covered false
    cp_prefix "02"
  end
  
  factory :city, class: "City" do
    name "Abrera"
    state
  end
  
  factory :vehicle do
    name "Ciclomotor"
    code "F1"
  end
  
  factory :car, class: "Vehicle" do
    name "Turismo de menos de 8 CV"
    code "A1"
  end
  
  factory :moto, class: "Vehicle" do
    name "Motocicleta de menos de 125 cc"
    code "F2"
  end
  
  factory :price do
    vehicle
    city
    price 199.99
    year 2012
  end
  
  factory :quote do
    cc_engine 125
    number_cylinders 2
    stroke 2
    amount 79.98
    plaking_date "14/07/1971"
    city
    vehicle
  end
  
  factory :tax do
    symbol "new_tax"
    percentage 21.0
  end
  
  factory :concept, class: "QuoteConcept" do
    symbol "new concept"
    net_amount 10
    tax_id 2
    show_before true
    ordering 6
    for_car true
    for_ciclo false
    for_moto false
  end
  
  factory :status do
    name "Pending documentation"
  end
  
  factory :order do
    first_name "Angel"
    last_name "Villalba"
    address "Vandelvira 8, 3 dcha"
    email "ejemplo@ejemplo.es"
    phone_number "933739443"
    shop "Concesionario Estupendo"
    status
    quote
    user
  end
  
  factory :user do
    name "Angel"
    email "a@b.com"
    password "foobar"
    password_confirmation "foobar"
  end

end