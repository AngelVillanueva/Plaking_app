Given /^I am in the homepage$/ do
    FactoryGirl.create(:state)
    FactoryGirl.create(:state_not_covered)
  visit root_path
end

When /^I go to the States Admin Area$/ do
  FactoryGirl.create(:state, name: "Liliput")
  visit states_path
end

Then /^I should see a list of States$/ do
  page.should have_selector('td', text: "Liliput")
end

Then /^I should not see a list of States$/ do
  page.should_not have_selector('td', text: "Liliput")
end

When /^I go to the New State page$/ do
  FactoryGirl.create(:state)
  visit new_state_path
end

Then /^I should see a form$/ do
  page.should have_selector('form')
end

When /^I fill a valid information for a new State$/ do
  fill_in "Name", with: "Liliput"
  fill_in "CP", with: "01"
  select "true", from: "Covered"
end

Then /^there should be one State more in the app$/ do
  expect do
    click_button "Create State"
  end.to change(State, :count).by(1)
end

When /^I fill an invalid information for a new State$/ do
  select "true", from: "Covered"
end

When /^I go to delete a State$/ do
  FactoryGirl.create(:state)
  visit states_path
end

When /^I go to edit a State$/ do
  @state_editable = FactoryGirl.create(:state)
  visit edit_state_path(@state_editable)
end

When /^I make a valid change for the State$/ do
  fill_in "CP", with: "10"
  click_button "Update State"
end

Then /^the State should reflect the change$/ do
  page.should have_content("State successfully updated")
  @state_editable.reload
  @state_editable.cp_prefix.should == "10"
end
