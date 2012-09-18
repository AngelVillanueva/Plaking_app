## Given

Given /^I have selected a covered State$/ do
  #state = FactoryGirl.create(:state)
  visit root_path
  #select state.name, from: "state_name"
  select "Barcelona", from: "state_name"
end

Given /^I have prepared a Quote for the city of (.*?)$/ do |city|
  #city = FactoryGirl.create(:city)
  #vehic_type = FactoryGirl.create(type)
  #FactoryGirl.create(:price, city: city, vehicle: vehic_type)
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

When /^I create the Quote for (.*?) without (.*?) data$/ do |type, engine_field|
  select type, from: "Vehicle"
  fill_in "Engine cc", with: 125 unless engine_field == "Engine cc"
  fill_in engine_field, with: ""
end

When /^I select the (.*?) from "(.*?)"$/ do |value, field|
  select value, from: field
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

Then /^the Quote should not be valid$/ do
  expect do
    click_button "Create Quote"
  end.not_to change(Quote, :count).by(1)
  page.should have_content("Error saving the Quote")
end
