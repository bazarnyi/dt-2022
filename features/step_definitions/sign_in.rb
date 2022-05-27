Given(/^Gitlab login page is opened$/) do
  visit 'https://gitlab.testautomate.me/users/sign_in'
end

When(/^I fill in username$/) do
  find('#user_login').set 'uitestuser'
end

And(/^I fill in password$/) do
  find('#user_password').set 'testpassword123'
end

And(/^I click sign in button$/) do
  find('#new_user > div.submit-container.move-submit-down > button').click
end

Then(/^I see that user is logged in$/) do
  expect(find(:xpath, '//*[@id="content-body"]/div[2]/div[1]/h2').text).to eql 'Welcome to GitLab'
end