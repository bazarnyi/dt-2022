@selenium
Feature: This is a course milestone script

  Scenario: Users can efficiently perform project management in GitLab
    Given I register 'Project Owner' user via 'API'
    And I see this 'Project Owner' user is registered via 'API'
    And I register 'Developer' user via 'API'
    And I see this 'Developer' user is registered via 'API'

    When I log in to gitlab with 'Project Owner' user
    Then I can see 'Create a project' button on the 'Home Page'
    When I create a nwe blank project
    Then I see that project was successfully created

    When I open 'Project members' page
    Then I can see 'Invite members' button
    When I click 'Invite members' button
    And I can see fill in search field with 'Developer' user name
    Then I can see 'Developer' user is found
    When I select Developer role
    And I click Invite button
    Then I can see that 'Developer' user was invited
    When I create new issue
    Then I can see that I can assign it to a 'Developer' user

    When I log out
    And I log in to gitlab with 'Developer' user
    Then I can see that I have an issue assigned
    When I open the issue
    Then I can leave a text comment
    And I can attach png file to comment
    And I can 'Add a to do'
    And I can 'Mark as done'
    And I can close the issue

    When I log out
    And I log in to gitlab with 'Project Owner' user
    Then I can go to Project General settings
    When I expand Advanced Settings
    And I delete project
    Then I see that project is deleted

    When I log out
    Then I can delete 'Project Owner' user via API
    And I can delete 'Developer' user via API


