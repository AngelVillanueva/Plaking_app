Given /^I am in the New Order page$/ do
  mock_price = FactoryGirl.create(:price)
  FactoryGirl.create(:status)
  visit root_path
  select "Barcelona", from: "state_name"
  click_button "Check State"
  select "Abrera", from: "City"
  select "Ciclomotor", from: "Vehicle"
  click_button "Create Quote"
  click_link "Accept and Continue"
end

Given /^I am in the Edit Order page$/ do
  order = FactoryGirl.create(:order)
  FactoryGirl.create(:status, name: "Documentation sent")
  visit edit_order_path(order)
end