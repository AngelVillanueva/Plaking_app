Given /^I am in the Order page$/ do
  @order = FactoryGirl.create(:order)
  visit order_path(@order)
end

When /^I follow the "(.*?)" link$/ do |link_text|
  click_link link_text
end
