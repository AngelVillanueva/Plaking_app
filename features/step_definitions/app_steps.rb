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

Given /^there is at least one tax created$/ do
  @tax = FactoryGirl.create(:tax)
end

Given /^there is at least one Quote Concept created$/ do
  @concept = FactoryGirl.create(:concept)
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
  visit "/#{controller.pluralize.downcase}"
end

When /^I go to the Quote Concepts Administration Area$/ do
  visit quote_concepts_path
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

When /^I go to create a new Tax$/ do
  visit new_tax_path
end

When /^I go to delete a tax$/ do
  visit taxes_path
end

When /^I go to edit a tax$/ do
  step "there is at least one tax created"
  visit edit_tax_path(@tax)
end

When /^I try to delete a tax$/ do
  visit taxes_path
  click_link I18n.t(:delete_tax)
end

When /^I try to delete a Quote Concept$/ do
  visit quote_concepts_path
  click_link I18n.t(:delete_concept)
end

When /^I try to edit a tax$/ do
  visit taxes_path
  click_link I18n.t(:edit_tax)
  fill_in "Symbol", with: "modified_tax"
  click_button I18n.t(:update_tax)
end

When /^I try to edit a tax with wrong information$/ do
  visit taxes_path
  click_link I18n.t(:edit_tax)
  fill_in "Symbol", with: "modified_tax"
  fill_in "Percentage", with: -10
  click_button I18n.t(:update_tax)
end

When /^I try to edit a Quote Concept$/ do
  visit quote_concepts_path
  click_link I18n.t(:edit_concept)
  fill_in "Symbol", with: "modified_concept"
  click_button I18n.t(:update_concept)
end

When /^I try to edit a Quote Concept with wrong information$/ do
  visit quote_concepts_path
  click_link I18n.t(:edit_concept)
  fill_in "Net amount", with: ""
  click_button I18n.t(:update_concept)
end


When /^I go to create a new Quote Concept$/ do
  visit new_quote_concept_path
end

When /^I go to delete a Quote Concept$/ do
  visit quote_concepts_path
end

When /^I go to edit a Quote Concept$/ do
  step "there is at least one Quote Concept created"
  visit edit_quote_concept_path(@concept)
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

When /^I make an invalid change for the State$/ do
  fill_in "CP", with: ""
  click_button "Update State"
end

When /^I create the Quote for (.*?) without (.*?) data$/ do |type, engine_field|
  select type, from: "Vehicle"
  fill_in "Engine cc", with: 125 unless engine_field == "Engine cc"
  fill_in engine_field, with: ""
end

When /^I enter the \{"(.*?)": "(.*?)", "(.*?)": "(.*?)"\}$/ do |engine_field, engine_value, cylinders_field, cylinders_value|
  fill_in engine_field, with: engine_value
  fill_in cylinders_field, with: cylinders_value
  click_button "Create Quote"
end

When /^I create a valid User$/ do
  fill_in "Name", with: "Nuevo usuario"
  fill_in "Email", with: "nuevo@email.com"
  fill_in "Password", with: "foobar"
  fill_in "Password confirmation", with: "foobar"
  click_button "Create User"
end

When /^I supply all the tax data$/ do
  fill_in "Symbol", with: "new tax"
  fill_in "Percentage", with: 8.00
  click_button I18n.t(:create_tax)
end

When /^I do not supply all the tax data$/ do
  fill_in "Symbol", with: "new tax"
  fill_in "Percentage", with: -8.00
  click_button I18n.t(:create_tax)
end

When /^I supply all the Concept data$/ do
  fill_in "Symbol", with: "new concept"
  fill_in I18n.t(:net_amount), with: 10
  select "vat_general", from: "Tax"
  check "Show before"
  fill_in "Ordering", with: 6
  check "For car"
  uncheck "For ciclo"
  check "For moto"
  click_button I18n.t(:create_quote_concept)
end

When /^I do not supply all the Concept data$/ do
  fill_in "Symbol", with: "new concept"
  click_button I18n.t(:create_quote_concept)
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

Then /^I should see the links within the admin menu$/ do 
  page.should have_link(I18n.t(:states_management), href: states_path)
  page.should have_link(I18n.t(:orders_management), href: orders_path)
  page.should have_link(I18n.t(:status_management), href: statuses_path)
  page.should have_link(I18n.t(:taxes_management), href: taxes_path)
end

Then /^I should not see the links within the admin menu$/ do 
  page.should_not have_link(I18n.t(:states_management), href: states_path)
  page.should_not have_link(I18n.t(:orders_management), href: orders_path)
  page.should_not have_link(I18n.t(:status_management), href: statuses_path)
  page.should_not have_link(I18n.t(:taxes_management), href: taxes_path)
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

Then /^I should see the cell "(.*?)" in the table$/ do |td_item_text|
  page.should have_selector('td', text: td_item_text)
end

Then /^I should see the new Tax cell in the table$/ do
  step 'I should see the cell "new tax" in the table'
  step 'I should see the cell "8.0" in the table'
end

Then /^I should not see the new Tax cell in the table$/ do
  page.should have_selector("form[action='/#{I18n.locale}/#{I18n.t("taxes")}']")
end

Then /^I should see the separate value for each "(.*?)" line$/ do |list_items|
  item = list_items.split(",")
  item.each do |i|
    page.should have_selector('li', text: i)
  end
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

Then /^the State should not reflect the change$/ do
  page.should have_content("Error updating the State")
  cp = @state_editable.cp_prefix
  @state_editable.reload
  @state_editable.cp_prefix.should == cp
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

Then /^I should be redirected to the home page$/ do
  page.should have_selector('h1', text: I18n.t("welcome"))
end

Then /^I should see a tax deletion confirmation message$/ do
  page.should have_content(I18n.t(:tax_deleted_success))
  page.should have_selector('title', text: I18n.t(:taxes_list))
end

Then /^I should see a concept deletion confirmation message$/ do
  page.should have_content(I18n.t(:concept_deleted_success))
  page.should have_selector('title', text: I18n.t(:concepts_list))
end

Then /^I should see a tax edition confirmation message$/ do
  page.should have_content(I18n.t(:tax_edition_success))
  page.should have_selector('title', text: I18n.t(:taxes_list))
end

Then /^I should see a concept edition confirmation message$/ do
  page.should have_content(I18n.t(:concept_edition_success))
  page.should have_selector('title', text: I18n.t(:concepts_list))
end

Then /^I should see a tax edition error message$/ do
  page.should have_content(I18n.t(:tax_edition_error))
end

Then /^I should see a concept edition error message$/ do
  page.should have_content(I18n.t(:concept_edition_error))
end

Then /^I should see the edited Tax cell in the table$/ do
  page.should have_selector('td', text: "modified_tax")
end

Then /^I should be back in the Edit Tax page$/ do
  page.should have_selector('title', text: I18n.t(:edit_tax_page))
end

Then /^I should see the new Quote Concept cell in the table$/ do
  page.should have_selector('title', text: I18n.t(:concepts_list))
  page.should have_selector('td', text: "New Concept")
end

Then /^I should not see the new Quote Concept cell in the table$/ do
  page.should have_selector('title', text: I18n.t(:new_concept_page))
  page.should_not have_selector('td', text: "New Concept")
end

Then /^I should see the edited Quote Concept cell in the table$/ do
  page.should have_selector('td', text: "Modified Concept")
end

Then /^I should be back in the Edit Quote Concept page$/ do
  page.should have_selector('title', text: I18n.t(:edit_concept_page))
end

Then /^the flash message should be gone if I left the page$/ do
  visit root_path
  page.should_not have_css('div.flash')
end