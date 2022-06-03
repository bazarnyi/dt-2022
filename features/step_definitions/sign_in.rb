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
  expect(@home_page.welcome_msg.text).to eql 'Welcome to GitLab'
end

Given(/^GitLab user is signed in$/) do
  sign_in_user 'uitestuser', 'testpassword123'
end