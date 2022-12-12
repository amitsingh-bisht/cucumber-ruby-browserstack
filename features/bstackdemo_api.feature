@bstackdemo
Feature: Bstackdemo API test

  @api @tc6
  Scenario Outline: I login to bstackdemo website with api
    Given I login to bstackdemo with username as <username> and password as <password> and expect status response to be <response_code>

    Examples:
      | username | password       | response_code |
      | demouser | testingisfun99 | 200           |
      | demouser | devisfun99     | 200           |

  @api @tc7
  Scenario: Get all products
    Given I get all products
    Then I verify product count should be 25

  @api @tc8
  Scenario Outline: Get each product count
    Given I get all products
    Then I verify product count for <product> should be <count>

    Examples:
      | product | count |
      | Apple   | 9     |
      | Samsung | 7     |
      | Google  | 3     |
      | OnePlus | 6     |

  @api @tc9
  Scenario: Get all offers
    Given I get all orders
    Then I verify order count should be 5

  @api @tc10
  Scenario: Get all offers
    Given I get all offers
    Then I verify all offers title
