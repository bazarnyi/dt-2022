# frozen_string_literal: true

class SignUpPage < SitePrism::Page
  set_url 'https://gitlab.testautomate.me/users/sign_up'

  element :first_name_field, '#new_user_first_name'
  element :last_name_field, '#new_user_last_name'
  element :username_field, '#new_user_username'
  element :email_field, '#new_user_email'
  element :password_field, '#new_user_password'
  element :register_btn, '#new_new_user > div.submit-container.gl-mt-5 > input'
end
