Given /^I am in the New Quote page$/ do
  FactoryGirl.create(:price)
  visit root_path
  select "Barcelona", from: "Name"
  click_button "Check State"
end