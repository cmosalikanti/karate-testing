@dataDriven
Feature:  Data driven testing example

  Background:
    * url apiUrl
    * def pause = function(inMillis) { java.lang.Thread.sleep(inMillis * 1000) }

  Scenario Outline: Create users
    * path '/api/user'
    * request { name: '#(name)', designation: '#(position)'}
    * method Post
    * status 201
    * match response == { name: '#(name)', designation: '#(position)', id: '#string', createdAt: '#string'}
    * print 'Iteration: ' + name + "-" + position + "-" + iteration
    * pause(2)

    Examples:
      | name  | position  | iteration |
      | John  | Manager   |     1     |
      | Steve | Developer |     2     |
      | Brian | Tester    |     3     |
      | Dan   | Director  |     4     |


