Feature: Sign up feature

  Scenario: User can sign up via API
    When I register user via API
    Then I see that user is registered via API

  Scenario: Registered user can sign up
    Given Gitlab sign up page is opened
    When I sign in as a preregistered user
    Then I see that user is logged in
    And I can delete user via API

