Given /^I am in the Users page$/ do
  FactoryGirl.create(:user)
  visit users_path
end

Then /^I should see the header "(.*?)"$/ do |header_text|
  page.should have_selector('h1', text: header_text)
end

Given /^I see a User called "(.*?)"$/ do |theuser|
  page.should have_selector('li', text: theuser)
end

Given /^I am in the Edit User page$/ do
  user = FactoryGirl.create(:user)
  visit edit_user_path(user)
end

Given /^I am in the New User page$/ do
  visit signup_path
end

Then /^the "(.*?)" count should be increased by "(.*?)"$/ do |model, range|
  expect { click_button "Create User" }.to change(model.constantize, :count).by(range.to_i)
end

Then /^the "(.*?)" count should not be increased by "(.*?)"$/ do |model, range|
  expect { click_button "Create User" }.not_to change(model.constantize, :count).by(range.to_i)
end