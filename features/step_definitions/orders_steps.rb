Given /^I have created a Quote$/ do
  mock_price = FactoryGirl.create(:price)
  FactoryGirl.create(:status)
  visit root_path
  select "Barcelona", from: "state_name"
  click_button "Check State"
  select "Abrera", from: "City"
  select "Ciclomotor", from: "Vehicle"
  click_button "Create Quote"
end

When /^I go to the New Order page$/ do
  click_link "Accept and Continue"
end

Given /^I am not a logged user$/ do
  visit root_path
  page.should have_selector('a', text: "Sign in")
  page.should_not have_selector('a', text: "Sign out")
end

Then /^I cannot create an Order before signing up or in$/ do
  page.should have_selector('title', text: "New User")
  page.should have_selector("form[action='/users']")
end

Given /^I have been redirected to signup page before creating an Order$/ do
  step "I am not a logged user"
  step "I have created a Quote"
  step "I go to the New Order page"
end

When /^I create a valid User$/ do
  fill_in "Name", with: "Nuevo usuario"
  fill_in "Email", with: "nuevo@email.com"
  fill_in "Password", with: "foobar"
  fill_in "Password confirmation", with: "foobar"
  click_button "Create User"
end

Then /^I am able to create a new Order$/ do
  page.should have_content "The new user was created successfully"
  page.should have_content "Address"
end

Given /^I am in the Edit Order page$/ do
  order = FactoryGirl.create(:order)
  FactoryGirl.create(:status, name: "Documentation sent")
  visit edit_order_path(order)
end