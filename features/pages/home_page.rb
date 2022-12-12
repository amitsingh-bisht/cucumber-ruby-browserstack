require 'logger'
require 'selenium_webdriver_helper'

include SeleniumWebdriverHelper

class BStackDemo
  def visit_website
    get_url(BSTACKDEMO)
    maximize_window
    save_screenshot('screenshots/visit_website.png')
    log_info('website visited successfully and captured screenshot as bstackdemo.png')
  end

  def login
    element_click(LOC_BSTACKDEMO_SIGNIN)
    element_click(LOC_USERNAME_DROPDOWN)
    element_click(LOC_USERNAME)
    element_click(LOC_PASSWORD_DROPDOWN)
    element_click(LOC_PASSWORD)
    save_screenshot('screenshots/bstackdemo_login.png')
    element_click(LOC_LOGIN_BUTTON)
  end

  def add_product_to_favourite
    @product_title = element_text(LOC_FIRST_SHELF_ITEM_TITLE)
    @product_price = element_text(LOC_FIRST_SHELF_ITEM_PRICE)
    element_click(LOC_FAVOURITE_ICON)
  end

  def check_product_in_favourite
    element_click(LOC_NAV_FAVOURITE)
    element_text(LOC_FAVOURITE_PRODUCTS_FOUND).eql? FAVOURITE_PRODUCTS_FOUND
    element_text(LOC_FIRST_SHELF_ITEM_TITLE).eql? @product_title
    element_text(LOC_FIRST_SHELF_ITEM_PRICE).eql? @product_price
  end

  def add_product_to_cart
    @product_title = element_text(LOC_FIRST_SHELF_ITEM_TITLE)
    @product_price = element_text(LOC_FIRST_SHELF_ITEM_PRICE)
    element_click(LOC_FIRST_SHELF_ITEM_ATC)
    save_screenshot('screenshots/add_product_to_cart.png')
    element_text(LOC_BAG_QUANTITY).eql? '1'
  end

  def check_product_in_cart
    element_displayed?(LOC_CART_CONTENT)
    save_screenshot('screenshots/check_product_in_cart.png')
    element_text(LOC_FIRST_PRODUCT_TITLE).eql? @product_title
  end

  def click_on_checkout_button
    element_click(LOC_CART_CHECKOUT)
  end

  def verify_cart
    click_on_checkout_button
    element_text(LOC_CART_HEADER).eql? CART_HEADER
    element_text(LOC_CART_PRODUCT_TITLE).eql? @product_title
    element_text(LOC_CART_TOTAL_PRICE).eql? @product_price
  end

  def add_address
    click_on_checkout_button
    find_element_and_send_keys(LOC_CART_FIRST_NAME, FIRST_NAME)
    find_element_and_send_keys(LOC_CART_LAST_NAME, LAST_NAME)
    find_element_and_send_keys(LOC_CART_ADDRESS, LAST_NAME)
    find_element_and_send_keys(LOC_CART_STATE, STATE)
    find_element_and_send_keys(LOC_CART_POST_CODE, POST_CODE)
    element_click(LOC_CART_SUBMIT_BUTTON)
  end
end
