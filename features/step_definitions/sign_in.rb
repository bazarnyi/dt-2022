Given(/^Gitlab login page is opened$/) do
  @sign_in_page = SignInPage.new
  @sign_in_page.load
end

When(/^I fill in username$/) do
  @sign_in_page.login_field.set 'uitestuser'
end

And(/^I fill in password$/) do
  @sign_in_page.password_field.set 'testpassword123'
end

And(/^I click sign in button$/) do
  @sign_in_page.sign_in_btn.click
end

Then(/^I see that user is logged in$/) do
  @home_page = HomePage.new
  expect(@home_page.welcome_msg.text).to include 'Welcome to GitLab'
end

Given(/^GitLab user is signed in$/) do
  sign_in_user 'uitestuser', 'testpassword123'
end

When(/^I sign in as a preregistered user$/) do
  user_credentials = JSON.parse(File.read('user.json'))
  sign_in_user user_credentials['username'], user_credentials['password']
end

Then(/^I see that new user is logged in$/) do
  @new_user_welcome_page = NewUserWelcomePage.new
  expect(@new_user_welcome_page.welcome_msg.text).to include 'Welcome to GitLab'
end