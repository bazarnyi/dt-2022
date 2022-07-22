@selenium
Feature: Sign in feature

    Scenario: User can log in
      Given Gitlab login page is opened
      When I fill in username
      And I fill in password
      And I click sign in button
      Then I see that user is logged in

    Scenario: User can login using helper module
      Given GitLab user is signed in
      Then I see that user is logged in