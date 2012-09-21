## Given
Given /^I am in the homepage$/ do
  visit root_path
end

Given /^I am in the Order page$/ do
  step "I am a logged common user"
  @order = FactoryGirl.create(:order, user: @user)
  visit order_path(@order)
end

Given /^I am in the Edit Order page$/ do
  step "I am a logged common user"
  order = FactoryGirl.create(:order, user: @user)
  FactoryGirl.create(:status, name: "Documentation sent")
  visit edit_order_path(order)
end

Given /^I am in the Sign in page$/ do
  FactoryGirl.create(:user)
  visit signin_path
end

Given /^I have already a valid account$/ do
  @already_user = FactoryGirl.create(:user)
end

Given /^I am signed in$/ do
  FactoryGirl.create(:user)
  visit signin_path
  fill_in "Email", with: "a@b.com"
  fill_in "Password", with: "foobar"
  click_button "Sign in"
end

Given /^I am a logged Admin user$/ do
  admin = FactoryGirl.create(:user, email: "admin@ex.com", admin: true)
  visit signin_path
  fill_in "Email", with: admin.email
  fill_in "Password", with: "foobar"
  click_button "Sign in"
end

Given /^I am a logged common user$/ do
  @user = FactoryGirl.create(:user, email: "common@ex.com")
  visit signin_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: "foobar"
  click_button "Sign in"
end

Given /^I am not a logged user$/ do
  visit root_path
  page.should have_selector('a', text: "Sign in")
  page.should_not have_selector('a', text: "Sign out")
end

Given /^I have selected a covered State$/ do
  step "I am in the homepage"
  select "Barcelona", from: "state_name"
end

Given /^I have prepared a Quote for the city of (.*?)$/ do |city|
  step "I have selected a covered State"
  step "I click \"Check State\""
  select city, from: "City"
end

Given /^I have created a Quote$/ do
  FactoryGirl.create(:status)
  step "I have prepared a Quote for the city of VIC"
  select "Ciclomotor", from: "Vehicle"
  click_button "Create Quote"
  #click_button I18n.t("Create Quote")
end

Given /^I have been redirected to signup page before creating an Order$/ do
  step "I am not a logged user"
  step "I have created a Quote"
  step "I go to the New Order page"
end

Given /^I have some orders in place$/ do
  order_one = FactoryGirl.create(:order, user: @user)
  order_two = FactoryGirl.create(:order, shop: "Another", user: @user)
end

## When
When /^I select "(.*?)" as "(.*?)"$/ do |value, selector|
  select value, from: selector
end

When /^I click "(.*?)"$/ do |button|
  click_button button
end

When /^I select the (.*?) from "(.*?)"$/ do |value, field|
  select value, from: field
end

When /^I follow the "(.*?)" link$/ do |link_text|
  click_link link_text
end

When /^I go to any page$/ do
  step "I am in the homepage"
end

When /^I go to the (.*?) Admin Area$/ do |controller|
  visit "/#{controller.downcase}"
end

When /^I go to the New State page$/ do
  visit new_state_path
end

When /^I go to the Users page$/ do
  visit users_path
end

When /^I go to delete a State$/ do
  visit states_path
end

When /^I go to the New Order page$/ do
  click_link "Accept and Continue"
end

When /^I go to edit a State$/ do
  @state_editable = FactoryGirl.create(:state)
  visit edit_state_path(@state_editable)
end

When /^I fill a valid information for a new State$/ do
  fill_in "Name", with: "Liliput"
  fill_in "CP", with: "01"
  select "true", from: "Covered"
end

When /^I fill an invalid information for a new State$/ do
  select "true", from: "Covered"
end

When /^I make a valid change for the State$/ do
  fill_in "CP", with: "10"
  click_button "Update State"
end

When /^I create the Quote for (.*?) without (.*?) data$/ do |type, engine_field|
  select type, from: "Vehicle"
  fill_in "Engine cc", with: 125 unless engine_field == "Engine cc"
  fill_in engine_field, with: ""
end

When /^I enter the \{"(.*?)": "(.*?)", "(.*?)": "(.*?)", "(.*?)": "(.*?)"\}$/ do |engine_field, engine_value, cylinders_field, cylinders_value, stroke_field, stroke_value|
  fill_in engine_field, with: engine_value
  fill_in cylinders_field, with: cylinders_value
  select stroke_value, from: stroke_field
  click_button "Create Quote"
end

When /^I create a valid User$/ do
  fill_in "Name", with: "Nuevo usuario"
  fill_in "Email", with: "nuevo@email.com"
  fill_in "Password", with: "foobar"
  fill_in "Password confirmation", with: "foobar"
  click_button "Create User"
end

When /^I sign in as a valid user$/ do
  click_link "Sign in here!"
  fill_in "Email", with: @already_user.email
  fill_in "Password", with: @already_user.password
  click_button "Sign in"
end

When /^I try to see a different user$/ do
  FactoryGirl.create(:user, email: "999@ex.com", id: 999)
  visit user_path(999)
end

## Then
Then /^I should see "(.*?)"$/ do |text_message|
  page.should have_content text_message
end

Then /^I should not see "(.*?)"$/ do |text_message|
  page.should_not have_content text_message
end

Then /^I should see a form$/ do
  page.should have_selector('form')
end

Then /^I should see the link "(.*?)"$/ do |link_text|
  page.should have_selector('a', text: link_text)
end

Then /^I should not see the link "(.*?)"$/ do |link_text|
  page.should_not have_selector('a', text: link_text)
end

Then /^the page title should be "(.*?)"$/ do |page_title|
  page.should have_selector('title', text: page_title)
end

Then /^I should not see the header "(.*?)"$/ do |header_text|
  page.should_not have_selector('h1', text: header_text)
end

Then /^I should not arrive to the "(.*?)" page$/ do |controller|
  visit "/#{controller.downcase}"
  page.should have_selector('title', text: "Welcome")
end

Then /^I should see a list of States$/ do
  page.should have_selector('a', text: "New State")
  page.should have_selector('th', text: "State")
  page.should have_selector('td', text: "Badajoz")
end

Then /^I should not see a list of States$/ do
  page.should_not have_selector('td', text: "Liliput")
end

Then /^I should see a list of all Orders$/ do
  order = FactoryGirl.create(:order)
  visit current_path
  page.should have_selector('th', text: "Status")
  page.should have_selector('td', text: "Order ##{order.id}")
end

Then /^I should see a list of all Users$/ do
  page.should have_selector('th', text: "Name")
  page.should have_selector('td', text: "Angel")
end

Then /^I should see the item "(.*?)" in the list$/ do |li_item_text|
  page.should have_selector('li', text: li_item_text)
end

Then /^there should be one State more in the app$/ do
  expect do
    click_button "Create State"
  end.to change(State, :count).by(1)
end

Then /^the State should reflect the change$/ do
  page.should have_content("State successfully updated")
  @state_editable.reload
  @state_editable.cp_prefix.should == "10"
end

Then /^the Quote should not be valid$/ do
  expect do
    click_button "Create Quote"
  end.not_to change(Quote, :count).by(1)
  page.should have_content("Error saving the Quote")
end

Then /^I cannot create an Order before signing up or in$/ do
  page.should have_selector('title', text: "New User")
  page.should have_selector("form[action='/#{I18n.locale}/users']")
end

Then /^I am able to create a new Order$/ do
  page.should have_selector("form[action='/#{I18n.locale}/orders']")
end
