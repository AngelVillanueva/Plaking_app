#@state_covered = State.create(name: "Barcelona", covered: true)
#@state_not_covered = State.create(name: "Albacete", covered: false)
#@city_covered = @state_covered.cities.build(name: "Abrera").save

#FactoryGirl.create(:state)
#FactoryGirl.create(:state_not_covered)
#FactoryGirl.create(:city_covered)


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