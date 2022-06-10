When(/^I register user via API$/) do
  @user = User.new

  user_credentials = { username: @user.username, password: @user.password }.to_json
  File.open('user.json', 'w') { |file| file.write(user_credentials) }

  payload = {
    "name": "#{@user.firstname} #{@user.lastname}",
    "username": @user.username,
    "email": @user.email,
    "password": @user.password,
    "skip_confirmation": true
  }
  RestClient.post('https://gitlab.testautomate.me/api/v4/users', payload, headers={Authorization: 'Bearer FKzy_BpV5wAybKf7Z9JX'})
end

Then(/^I see that user is registered via API$/) do
  response = RestClient.get("https://gitlab.testautomate.me/api/v4/users?username=#{@user.username}", headers={Authorization: 'Bearer FKzy_BpV5wAybKf7Z9JX'})
  expect(response.code).to eql 200
  expect(JSON.parse(response.body)[0]['username']).to eql @user.username
  expect(JSON.parse(response.body)[0]['email']).to eql @user.email
  expect(JSON.parse(response.body)[0]['name']).to eql "#{@user.firstname} #{@user.lastname}"
end