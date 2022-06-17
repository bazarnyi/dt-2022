Then(/^I see that user is registered via API$/) do
  response = get_user_api @user
  expect(response.code).to eql 200
  expect(JSON.parse(response.body)[0]['username']).to eql @user.username
  expect(JSON.parse(response.body)[0]['email']).to eql @user.email
  expect(JSON.parse(response.body)[0]['name']).to eql "#{@user.firstname} #{@user.lastname}"
end

And(/^I can delete user via API$/) do
  response = delete_user_api
  expect(response.code).to eql 204
end