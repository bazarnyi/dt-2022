class SignInPage < SitePrism::Page
  set_url 'https://gitlab.testautomate.me/users/sign_in'

  element :login_field, '#user_login'
  element :password_field, '#user_password'
  element :sign_in_btn, '#new_user > div.submit-container.move-submit-down > button'
end