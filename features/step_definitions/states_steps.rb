Given /^I am in the homepage$/ do
    FactoryGirl.create(:state)
    FactoryGirl.create(:state_not_covered)
  visit root_path
end

When /^I select "(.*?)" as "(.*?)"$/ do |city, field|
  select city, from: field
end

When /^I click "(.*?)"$/ do |button|
  click_button button
end

Then /^I should see "(.*?)"$/ do |text_message|
  page.should have_content text_message
end

Then /^I should not see "(.*?)"$/ do |text_message|
  page.should_not have_content text_message
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
