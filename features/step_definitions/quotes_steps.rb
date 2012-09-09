Given /^I am in the New Quote page$/ do
  basic_price = FactoryGirl.create(:price)
  moto = FactoryGirl.create(:vehicle, name: "Motocicleta")
  FactoryGirl.create(:price, city_id: basic_price.city.id, vehicle_id: moto.id, price: 299.99)
  coche = FactoryGirl.create(:vehicle, name: "Turismo")
  FactoryGirl.create(:price, city_id: basic_price.city.id, vehicle_id: coche.id, price: 599.99)
  visit root_path
  select "Barcelona", from: "state_name"
  click_button "Check State"
end

When /^I fill "(.*?)" in "(.*?)"$/ do |value, field|
  fill_in field, with: value
end

When /^I select the date "(.*?)" as "(.*?)"$/ do |date_value, date_field|
  select_date date_field, with: date_value
end
