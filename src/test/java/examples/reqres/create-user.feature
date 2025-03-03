@createUser
Feature:  Create a user

  Background:
    * url apiUrl

  Scenario: Create a user
    And path '/api/user'
    * def nameValue = 'John'
    * def body =
      """
      {
        name: 'John',
        working: true
      }
      """
    And request body
    And header Content-Type = "application/json"
    When method Post
    Then status 201
    And match response == {name: '#(nameValue)', working: true, id: '#string', createdAt: '#string'}
    And match response.name == 'John'
    And match response.working == true
    * print 'Name is:' + response.name
