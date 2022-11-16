bstackdemo = BStackDemo.new

Given 'I visit bstackdemo website' do
  bstackdemo.visit_website
end
 
When "I add a product to the cart" do
  bstackdemo.add_product_to_cart
end
 
Then "I should see same product in cart section" do
  bstackdemo.check_product_in_cart
end
