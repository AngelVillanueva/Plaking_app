When /^I am in the New Status Page$/ do
  visit new_status_path
end

Then /^I should see the item "(.*?)" in the list$/ do |li_item_text|
  page.should have_selector('li', text: li_item_text)
end

Then /^I should not see the header "(.*?)"$/ do |header_text|
  page.should_not have_selector('h1', text: header_text)
end

