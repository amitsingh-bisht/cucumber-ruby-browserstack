@bstackdemo
Feature: Bstackdemo UI test

  @ui @tc1
  Scenario: I login to bstackdemo website
    Given I visit bstackdemo website
    Then I login to bstackdemo website

  @ui @tc2
  Scenario: I add first product to favourite
    Given I visit bstackdemo website
    Then I login to bstackdemo website
    When I click on favourite button
    Then I should see same product in favourite section

  @ui @tc3
  Scenario: I add first product to cart
    Given I visit bstackdemo website
    When I add a product to the cart
    Then I should see same product in cart section

  @ui @tc4
  Scenario: I verify my cart details
    Given I visit bstackdemo website
    Given I login to bstackdemo website
    When I add a product to the cart
    Then I verify my cart

  @ui @tc5
  Scenario: I add my shipping address and proceed to submit
    Given I visit bstackdemo website
    Given I login to bstackdemo website
    When I add a product to the cart
    Then I add my address
