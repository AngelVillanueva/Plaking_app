## Given
Given /^I am in the homepage$/ do
  visit root_path
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

When /^I go to the States Admin Area$/ do
  visit states_path
end

When /^I go to the New State page$/ do
  visit new_state_path
end

When /^I go to delete a State$/ do
  visit states_path
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

Then /^I should see a list of States$/ do
  page.should have_selector('a', text: "New State")
  page.should have_selector('th', text: "State")
  page.should have_selector('td', text: "Badajoz")
end

Then /^I should not see a list of States$/ do
  page.should_not have_selector('td', text: "Liliput")
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
