Given /^I am in the Sign in page$/ do
  FactoryGirl.create(:user)
  visit signin_path
end

Then /^I should see the link "(.*?)"$/ do |link_text|
  page.should have_selector('a', text: link_text)
end

Then /^I should not see the link "(.*?)"$/ do |link_text|
  page.should_not have_selector('a', text: link_text)
end

Given /^I am signed in$/ do
  FactoryGirl.create(:user)
  visit signin_path
  fill_in "Email", with: "a@ex.com"
  fill_in "Password", with: "foobar"
  click_button "Sign in"
end
