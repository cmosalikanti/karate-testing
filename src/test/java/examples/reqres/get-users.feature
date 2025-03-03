Feature:  Find users at Reqres portal
  Background:
    * url apiUrl
  Scenario: Get a user
    And path '/api/users/2'
    When method Get
    Then status 200

  Scenario: Get all users
    And path '/api/users'
    When method Get
    Then status 200
    And match response.page == 1
    * def data = response.data
    * def firstUser = response.data[0]
    * match firstUser.id == 1
    * match firstUser.first_name == 'George'
    * match each data contains { id: '#number'}
    * match each data contains { first_name: '#string'}

  Scenario: User not found
    And path '/api/users/23'
    When method Get
    Then status 404
