RSpec.configure do |config|
  require 'selenium/webdriver'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.color = true

  Selenium::WebDriver::Firefox::Binary.path =
  "/home/nathaniel/firefox-sdk//bin/firefox"
end
