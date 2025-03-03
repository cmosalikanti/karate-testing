Feature: Login with a user

  Background:
    * url apiUrl

  Scenario: Login with a user
    And path 'api/login'
    * def body =
      """
      {
        email: 'eve.holt@reqres.in',
        password: "cityslica"
      }
      """
    And request body
    And method Post
    Then status 200
    * match response contains { "token": '#string'}
