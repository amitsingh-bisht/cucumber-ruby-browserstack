require 'logger'
require "uri"
require "json"
require "net/http"

POST_SIGNIN = 'https://bstackdemo.com/api/signin'
GET_PRODUCTS = 'https://bstackdemo.com/api/products?userName=demouser'
GET_ORDERS = 'https://bstackdemo.com/api/orders?userName=existing_orders_user'
GET_OFFERS = 'https://bstackdemo.com/api/offers?userName=demouser&latitude=19.0760&longitude=72.8777'

class BStackDemoAPI
  def json_parser(json)
    JSON.parse(json)
  end

  def create_hosts(url)
    url = URI(url)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    [url, https]
  end

  def login(username, password, response_code)
    url, https = create_hosts(POST_SIGNIN)
    request = Net::HTTP::Post.new(url)
    request["accept"] = "*/*"
    request["Content-Type"] = "application/json"
    request.body = JSON.dump({ "userName": username, "password": password } )
    response = https.request(request)
    response.code.eql? response_code
  end

  def products
    url, https = create_hosts(GET_PRODUCTS)
    request = Net::HTTP::Get.new(url)
    request["accept"] = "*/*"
    response = https.request(request)
    @response = json_parser(response.read_body)
  end

  def verify_product_length(count)
    @response['products'].length.to_s.eql? count
  end

  def verify_each_product_length(product, count)
    product_count = 0
    @response['products'].each { |response_product| product_count += 1 if response_product['availableSizes'][0].eql? product }
    product_count.to_s.eql? count
  end

  def orders
    url, https = create_hosts(GET_ORDERS)
    request = Net::HTTP::Get.new(url)
    request["accept"] = "*/*"
    response = https.request(request)
    @response = json_parser(response.read_body)
  end

  def verify_orders_length(count)
    @response['orders'].length.to_s.eql? count
  end

  def offers
    url, https = create_hosts(GET_OFFERS)
    request = Net::HTTP::Get.new(url)
    request["accept"] = "*/*"
    response = https.request(request)
    @response = json_parser(response.read_body)
  end

  def verify_offers
    @response['offersData']['iphone']['title'].eql? '30% off on iPhones'
    @response['offersData']['dekstop']['title'].eql? '20% off on OnePlus'
    @response['offersData']['shipping']['title'].eql? 'Free Shipping'
  end
end