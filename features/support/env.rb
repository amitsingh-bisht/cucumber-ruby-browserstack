require 'logger'
require 'rubygems'
require 'selenium-webdriver'
require 'selenium_webdriver_helper'

include SeleniumWebdriverHelper

URL = 'https://username:accesskey@hub-cloud.browserstack.com/wd/hub'

Before do |scenario|

  feature_name = scenario.feature
  puts feature_name
  scenario_name = scenario.name
  puts scenario_name
  # tag_name = scenario.

	def run_remote_session
		logger = Logger.new('selenium.log')
		logger.info("Test is running in remote")
		url = URL.gsub("username",ENV["username"]).gsub("accesskey",ENV["accesskey"])
		capabilities = Selenium::WebDriver::Remote::Capabilities.new
		capabilities['browser'] = 'chrome'
		capabilities['browser_version'] = '96.0'
		capabilities['os'] = 'Windows'
		capabilities['os_version'] = '10'
		capabilities['name'] = 'parallel test 1' # Test name
		capabilities['build'] = 'automate flipkart website' # CI/CD job or build name
		capabilities['browserstack.debug'] = 'true'  # for enabling visual logs
		$driver = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities)
		initialize_driver($driver)
	end

	def run_local_session
		logger = Logger.new('selenium.log')
		logger.info("Test is running in local")
		Selenium::WebDriver::Chrome::Service.driver_path="./chromedriver"
		options = Selenium::WebDriver::Chrome::Options.new
		options.add_option('detach',true)
		caps = [options, Selenium::WebDriver::Remote::Capabilities.chrome]
		$driver = Selenium::WebDriver.for :chrome, capabilities:caps
		initialize_driver($driver)
	end

  ENV['remote'].eql?('true') ? run_remote_session : run_local_session
end

After do |scenario|
	# $driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed", "reason": "Flipkart website has been automated successfully !"}}')
	$driver.quit()
end
