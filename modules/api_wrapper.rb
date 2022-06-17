module APIWrapper
  def sign_up_user_api(user)
    payload = {
      "name": "#{user.firstname} #{user.lastname}",
      "username": user.username,
      "email": user.email,
      "password": user.password,
      "skip_confirmation": true
    }
    RestClient.post("#{ENV['ROOT_URL']}/api/v4/users", payload, headers=api_headers)
  end

  def get_user_api(user)
    RestClient.get("#{ENV['ROOT_URL']}/api/v4/users?username=#{user.username}", headers=api_headers)
  end

  def delete_user_api
    user_credentials = JSON.parse(File.read('user.json'))
    RestClient.delete("#{ENV['ROOT_URL']}/api/v4/users/#{user_credentials['id']}?hard_delete=true", headers=api_headers)
  end

  def api_headers
    { Authorization: ENV['API_TOKEN'] }
  end
end