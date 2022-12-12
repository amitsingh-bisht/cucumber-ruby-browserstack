bstackdemo = BStackDemo.new

Given 'I visit bstackdemo website' do
  bstackdemo.visit_website
end

Then 'I login to bstackdemo website' do
  bstackdemo.login
end

When "I click on favourite button" do
  bstackdemo.add_product_to_favourite
end

Then "I should see same product in favourite section" do
  bstackdemo.check_product_in_favourite
end

When "I add a product to the cart" do
  bstackdemo.add_product_to_cart
end
 
Then "I should see same product in cart section" do
  bstackdemo.check_product_in_cart
end

Then "I verify my cart" do
  bstackdemo.verify_cart
end

Then "I add my address" do
  bstackdemo.add_address
end
