Given(/^LabCoat app login screen is opened$/) do
  wait_for_activity_to_load 'LoginActivity'
end

When(/^I fill in Gitlab url$/) do
  find_element(:id, 'text_server').send_keys ENV['ROOT_URL']
end

And(/^I fill in token$/) do
  find_element(:id, 'textToken').send_keys ENV['MOBILE_TOKEN']
end

And(/^I click login button$/) do
  find_element(:id, 'buttonLogin').click
end

Then(/^I see that user is logged in to mobile app$/) do
  wait_for_activity_to_load 'ProjectsActivity'
  expect(@driver.driver.current_activity).to include 'ProjectsActivity'
end