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
  fill_in('name', :with => 'Dan')
end

When(/^I click "([^"]*)"$/) do |arg1|
  click_button('submit')
end

Given(/^I am on the new game page$/) do
  visit('/game/new')
end

When(/^I don't fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in('name', :with => '')
end

Given(/^I am on the start game page$/) do
  visit('/game')
end