require 'logger'
require 'rubygems'
require 'selenium-webdriver'
require 'selenium_webdriver_helper'

include SeleniumWebdriverHelper

def remote_capabilities
	url = 'https://username:accesskey@hub-cloud.browserstack.com/wd/hub'
	capabilities = Selenium::WebDriver::Remote::Capabilities.new
	capabilities['browser'] = 'chrome'
	capabilities['browser_version'] = '96.0'
	capabilities['os'] = 'Windows'
	capabilities['os_version'] = '10'
	capabilities['name'] = @scenario_name # Test name
	capabilities['build'] = @feature_name # CI/CD job or build name
	capabilities['browserstack.debug'] = 'true'  # for enabling visual logs
	Selenium::WebDriver.for :remote, :url => url.gsub!('username', ENV['username']).gsub!('accesskey', ENV['accesskey'])
	# Selenium::WebDriver.for :remote, :url => url.gsub!('username', ENV['username']).gsub!('accesskey', ENV['accesskey']), :desired_capabilities => capabilities
end

Before('@ui') do |scenario|
	@feature_name = scenario.feature
	@scenario_name = scenario.name
	@tag_name = scenario.source_tag_names
	logger = Logger.new('selenium.log')
	logger.info("#{@feature_name} - #{@scenario_name} test started")
	$driver = remote_capabilities
	initialize_driver($driver)
end

After('@ui') do |scenario|
	(scenario.failed?) ?
		$driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed", "reason": "BStackdemo website has not been automated successfully !"}}') :
		$driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed", "reason": "BStackdemo website has been automated successfully !"}}')
	$driver.quit
end
