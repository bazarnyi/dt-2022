class NewUserWelcomePage < SitePrism::Page

  element :welcome_msg, :xpath, '//*[@id="content-body"]/div[2]/div/div/h2'
end