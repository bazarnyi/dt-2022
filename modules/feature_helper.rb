module FeatureHelper
  def sign_in_user(username, password)
    @sign_in_page = SignInPage.new
    @sign_in_page.load
    @sign_in_page.login_field.set username
    @sign_in_page.password_field.set password
    @sign_in_page.sign_in_btn.click
  end
end