Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I follow "([^"]*)"$/) do |new_game|
  click_link(new_game)
end

Then(/^I should see "([^"]*)"$/) do |text|
   page.should have_content(text)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in('name', :with => 'my name')
end

When(/^I click "([^"]*)"$/) do |arg1|
  click_button('submit')
end