Feature:  Find users at Reqres portal
  Background:
    * url 'https://reqres.in'
  Scenario: Get a user
    And path '/api/users/2'
    When method Get
    Then status 200

  Scenario: Get all users
    And path '/api/users'
    When method Get
    Then status 200
    And match response.page == 1
    * def firstUser = response.data[0]
    And match firstUser.id == 1
    And match firstUser.first_name == 'George'

  Scenario: User not found
    And path '/api/users/23'
    When method Get
    Then status 404

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