require 'logger'
require 'selenium_webdriver_helper'

class BStackDemo
  include SeleniumWebdriverHelper

  def initialize(driver)
    super(driver)
  end

  def rescue_exception(e, message)
    $test_case_passed = false
    $test_case_message = e.message
    $logger.error(message)
    assert(false, "\t\t#{e.message} :- #{message}")
  end

  def visit_website
    begin
      $logger.info('visiting https://www.bstackdemo.com/')
      get('https://www.bstackdemo.com/')
      # $driver.navigate.to 'https://www.bstackdemo.com/'
      # $driver.save_screenshot('screenshots/screenshots.png')
      # $logger.info('website visited successfully and captured screenshot as bstackdemo.png')
    rescue Exception => e
      rescue_exception(e, 'failed in visiting bstackdemo website')
    end
  end
end
