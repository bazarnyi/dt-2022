Given(/^Gitlab sign up page is opened$/) do
  visit 'https://gitlab.testautomate.me/users/sign_up'
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

When(/^I register user via UI$/) do
  @user = User.new
  sign_up_user @user

  response = RestClient.get("https://gitlab.testautomate.me/api/v4/users?username=#{@user.username}", headers={Authorization: 'Bearer FKzy_BpV5wAybKf7Z9JX'})

  user_credentials = { username: @user.username, password: @user.password, id: JSON.parse(response.body)[0]['id'] }.to_json
  File.open('user.json', 'w') { |file| file.write(user_credentials) }
end