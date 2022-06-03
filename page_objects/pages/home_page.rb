class HomePage < SitePrism::Page
  element :welcome_msg, :xpath, '//*[@id="content-body"]/div[2]/div[1]/h2'
end