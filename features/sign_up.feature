@selenium
Feature: Sign up feature

  @sign_up
  Scenario: User can sign up
    Given Gitlab sign up page is opened
    When I fill in first name
    And I fill in last name
    And I fill in new username
    And I fill in new email
    And I fill in new password
    And I click Register button
    Then I see that user is registered