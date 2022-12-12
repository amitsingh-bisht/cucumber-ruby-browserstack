bstackdemo_ui = BStackDemoUI.new
bstackdemo_api = BStackDemoAPI.new

# UI Step Definitions
Given 'I visit bstackdemo website' do
  bstackdemo_ui.visit_website
end

Then 'I login to bstackdemo website' do
  bstackdemo_ui.login
end

When "I click on favourite button" do
  bstackdemo_ui.add_product_to_favourite
end

Then "I should see same product in favourite section" do
  bstackdemo_ui.check_product_in_favourite
end

When "I add a product to the cart" do
  bstackdemo_ui.add_product_to_cart
end
 
Then "I should see same product in cart section" do
  bstackdemo_ui.check_product_in_cart
end

Then "I verify my cart" do
  bstackdemo_ui.verify_cart
end

Then "I add my address" do
  bstackdemo_ui.add_address
end

# API Step Definitions
Given /^I login to bstackdemo with username as ([A-Za-z0-9_ ]+) and password as ([A-Za-z0-9_ ]+) and expect status response to be ([0-9]+)$/ do |username, password, response_code|
  bstackdemo_api.login(username, password, response_code)
end

Then "I get all products" do
  bstackdemo_api.products
end

Then /^I verify product count should be ([0-9]+)$/ do |count|
  bstackdemo_api.verify_product_length(count)
end

Then /^I verify product count for ([A-Za-z0-9_ ]+) should be ([0-9]+)$/ do |product, count|
  bstackdemo_api.verify_each_product_length(product, count)
end

Then "I get all orders" do
  bstackdemo_api.orders
end

Then /^I verify order count should be ([0-9]+)$/ do |count|
  bstackdemo_api.verify_orders_length(count)
end

Then "I get all offers" do
  bstackdemo_api.offers
end

Then "I verify all offers title" do
  bstackdemo_api.verify_offers
end
