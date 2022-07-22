@appium
Feature: Sign in feature

  Scenario: User can log in to mobile app
    Given LabCoat app login screen is opened
    When I fill in Gitlab url
    And I fill in token
    And I click login button
    Then I see that user is logged in to mobile app