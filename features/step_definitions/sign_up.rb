# frozen_string_literal: true

Given(/^Gitlab sign up page is opened$/) do
  visit "#{ENV['ROOT_URL']}/users/sign_up"
end

When(/^I fill in first name$/) do
  @user = User.new
  find('#new_user_first_name').set @user.firstname
end

And(/^I fill in last name$/) do
  find('#new_user_last_name').set @user.lastname
end

And(/^I fill in new username$/) do
  find('#new_user_username').set @user.username
end

And(/^I fill in new email$/) do
  find('#new_user_email').set @user.email
end

And(/^I fill in new password$/) do
  find('#new_user_password').set @user.password
end

And(/^I click Register button$/) do
  find('input[data-qa-selector="new_user_register_button"]').click
end

Then(/^I see that user is registered$/) do
  expect(find('#content-body h2').text).to eql "Welcome to GitLab,\n#{@user.firstname}!"
end

When(/^I register user via '([^"]*)'$/) do |method|
  @user = User.new
  case method
  when 'API'
    sign_up_user_api @user
    response = get_user_api @user
  when 'UI'
    sign_up_user @user
    response = get_user_api @user
  else
    raise 'User registration method is not defined'
  end

  user_credentials = { username: @user.username, password: @user.password,
                       id: JSON.parse(response.body)[0]['id'] }.to_json
  File.open('user.json', 'w') { |file| file.write(user_credentials) }
end
