Given /^I am in the New Order page$/ do
  mock_price = FactoryGirl.create(:price)
  visit root_path
  select "Barcelona", from: "Name"
  click_button "Check State"
  select "Abrera", from: "City"
  select "Ciclomotor", from: "Vehicle"
  click_button "Create Quote"
  click_link "Accept and Continue"
end