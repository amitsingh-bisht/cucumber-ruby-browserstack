require 'logger'
require 'selenium_webdriver_helper'

include SeleniumWebdriverHelper

class BStackDemo

  FIRST_PRODUCT_TITLE = 'iPhone 12'.freeze
  FIRST_SHELF_ITEM_TITLE = [:xpath, '//*[@id="1"]/p'].freeze
  FIRST_SHELF_ITEM_ADD_TO_CART = [:xpath, '//*[@id="1"]/div[4]'].freeze
  CART_CONTENT = [:xpath, '//*[@class="float-cart__content"]'].freeze
  CART_CONTENT_FIRST_PRODUCT_TITLE = [:xpath, '//*[@id="__next"]/div/div/div[2]/div[2]/div[2]/div/div[3]/p[1]'].freeze

  def visit_website
      get_url('https://www.bstackdemo.com/')
      save_screenshot('screenshots/visit_website.png')
      log_info('website visited successfully and captured screenshot as bstackdemo.png')
  end

  def add_product_to_cart
    element_text(FIRST_SHELF_ITEM_TITLE).eql? FIRST_PRODUCT_TITLE
    element_click(FIRST_SHELF_ITEM_ADD_TO_CART)
    save_screenshot('screenshots/add_product_to_cart.png')
  end

  def check_product_in_cart
    element_displayed?(CART_CONTENT)
    save_screenshot('screenshots/check_product_in_cart.png')
    element_text(CART_CONTENT_FIRST_PRODUCT_TITLE).eql? FIRST_PRODUCT_TITLE
  end
end
