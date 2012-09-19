Given /^I am in the Users page$/ do
  visit users_path
end

Given /^I am not signed in$/ do
  visit root_path
end

Given /^I am signed in at the application$/ do
  user = FactoryGirl.create(:user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

Then /^I should see the header "(.*?)"$/ do |header_text|
  page.should have_selector('h1', text: header_text)
end

Given /^I see a User called "(.*?)"$/ do |theuser|
  page.should have_selector('li', text: theuser)
end

Given /^I am in the Edit User page$/ do
  user = FactoryGirl.create(:user, email: "another@ex.com")
  visit edit_user_path(user)
end

Given /^I am in the New User page$/ do
  visit signup_path
end

Then /^the "(.*?)" count should be increased by "(.*?)"$/ do |model, range|
  expect { click_button "Create #{model.capitalize}" }.to change(model.constantize, :count).by(range.to_i)
end

Then /^the "(.*?)" count should not be increased by "(.*?)"$/ do |model, range|
  expect { click_button "Create #{model.capitalize}" }.not_to change(model.constantize, :count).by(range.to_i)
end

Then /^the "(.*?)" count should be decreased by "(.*?)"$/ do |model, range|
  expect do
    click_link "Delete"
  end.to change(model.constantize, :count).by(-(range.to_i))
end

When /^I try to edit a different user$/ do
  other_user = FactoryGirl.create(:user, email: "another@ex.com")
  visit edit_user_path(other_user)
end

Given /^I am at the Edit my User page$/ do
  own_user = FactoryGirl.create(:user)
  visit signin_path
  fill_in "Email", with: own_user.email
  fill_in "Password", with: own_user.password
  click_button "Sign in"
  visit edit_user_path(own_user)
end

When /^I sign in at the application$/ do
  user = FactoryGirl.create(:user)
  fill_in "Email", with: "another@ex.com"
  fill_in "Password", with: "foobar"
  click_button "Sign in"
end


