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