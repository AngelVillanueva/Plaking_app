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
    price 99.999
    year 2012
  end

end