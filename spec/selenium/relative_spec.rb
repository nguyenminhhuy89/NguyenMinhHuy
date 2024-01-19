require 'selenium-webdriver'
require 'spec_helper'

RSpec.describe 'Using Selenium for testing Relative selectors' do
  it 'uses eight components' do
    options = Selenium::WebDriver::Options.send "chrome"
    driver = Selenium::WebDriver.for(:remote,
      :url => "https://#{USER_NAME}:#{ACCESS_KEY}@hub.browserstack.com/wd/hub",
      :capabilities => options
    )
    begin
      driver = Selenium::WebDriver.for :chrome
      # wait = Selenium::WebDriver::Wait.new(timeout: 2) 
      driver.manage.timeouts.implicit_wait = 500
      driver.get('https://www.selenium.dev/selenium/web/web-form.html')
      original_window = driver.window_handle
      driver.switch_to.new_window(:tab)
      expect(driver.window_handles.size).to eq 2
    ensure
      driver.quit
    end
  end

  BUILD_NAME = "browserstack-build-1"
  caps = [{
  "os" => "Windows",
  "osVersion" => "11",
  "browserName" => "Chrome",
  "browserVersion" => "103.0",
  "buildName" => BUILD_NAME,
  "sessionName" => "Ruby thread 1"
  },
  {
  "os" => "Windows",
  "osVersion" => "10",
  "browserName" => "Firefox",
  "browserVersion" => "102.0",
  "buildName" => BUILD_NAME,
  "sessionName" => "Ruby thread 2"
  },
  {
  "os" => "OS X",
  "osVersion" => "Big Sur",
  "browserName" => "Safari",
  "browserVersion" => "14.1",
  "buildName" => BUILD_NAME,
  "sessionName" => "Ruby thread 3"
  }]
  t1 = Thread.new{ run_session(caps[0]) }
  t2 = Thread.new{ run_session(caps[1]) }
  t3 = Thread.new{ run_session(caps[2]) }
  t1.join()
  t2.join()
  t3.join()
end
