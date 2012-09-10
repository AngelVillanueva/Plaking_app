#Factory.define :state_covered, class: "State" do |s|
#  s.name "Barcelona"
#  s.covered true
#end
#
#Factory.define :state_not_covered, class: "State" do |s|
#  s.name "Albacete"
#  s.covered false
#end

FactoryGirl.define do

  factory :state do
    name "Barcelona"
    covered true
  end
  
  factory :state_not_covered, class: "State" do
    name "Albacete"
    covered false
  end
  
  factory :city, class: "City" do
    name "Abrera"
    state
  end
  
  factory :vehicle do
    name "Ciclomotor"
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
  end
  
  factory :user do
    name "Angel"
    email "a@ex.com"
    password "foobar"
    password_confirmation "foobar"
  end

end