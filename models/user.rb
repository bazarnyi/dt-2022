require 'ffaker'

class User
  attr_reader :username, :password, :firstname, :lastname, :email

  def initialize
    @username = FFaker::Internet.user_name
    @password = FFaker::Internet.password
    @firstname = FFaker::Name.first_name
    @lastname = FFaker::Name.last_name
    @email = FFaker::Internet.email
  end
end