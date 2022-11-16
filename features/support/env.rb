require 'logger'
require 'rubygems'
require 'selenium-webdriver'
require 'selenium_webdriver_helper'

include SeleniumWebdriverHelper

URL = 'https://username:accesskey@hub-cloud.browserstack.com/wd/hub'

def browserstack_remote_capabilities
	capabilities = Selenium::WebDriver::Remote::Capabilities.new
	capabilities['browser'] = 'chrome'
	capabilities['browser_version'] = '96.0'
	capabilities['os'] = 'Windows'
	capabilities['os_version'] = '10'
	capabilities['name'] = @scenario_name # Test name
	capabilities['build'] = @feature_name # CI/CD job or build name
	capabilities['browserstack.debug'] = 'true'  # for enabling visual logs
	Selenium::WebDriver.for :remote, :url => URL.gsub!('username', ENV['username']).gsub!('accesskey', ENV['accesskey']), :desired_capabilities => capabilities
end

def selenium_local_capabilities
	Selenium::WebDriver::Chrome::Service.driver_path = './chromedriver'
	options = Selenium::WebDriver::Chrome::Options.new
	options.add_option('detach', true)
	caps = [options, Selenium::WebDriver::Remote::Capabilities.chrome]
	Selenium::WebDriver.for :chrome, capabilities:caps
end

Before do |scenario|
  @feature_name = scenario.feature
  @scenario_name = scenario.name
  @tag_name = scenario.source_tag_names
	logger = Logger.new('selenium.log')
	logger.info("#{@feature_name} - #{@scenario_name} test started")
	$driver = ENV['remote'].eql?('true') ? browserstack_remote_capabilities : selenium_local_capabilities
	initialize_driver($driver)
end

After do |scenario|
	# $driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed", "reason": "Flipkart website has been automated successfully !"}}')
	$driver.quit
end
