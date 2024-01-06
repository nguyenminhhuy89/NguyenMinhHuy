require 'selenium-webdriver'
require 'spec_helper'

RSpec.describe 'Using Selenium for testing Relative selectors' do
  it 'uses eight components' do
    begin
      driver = Selenium::WebDriver.for :chrome
      # wait = Selenium::WebDriver::Wait.new(timeout: 2) 
      driver.manage.timeouts.implicit_wait = 500
      driver.get('https://www.selenium.dev/selenium/web/web-form.html')
      original_window = driver.window_handle
      driver.switch_to.new_window(:tab)
      expect(driver.window_handles.size).to eq 2
      # Get reference element 
      # txt = driver.find_element(xpath: '//input[@name="my-text"]')
      # txt.clear
      # txt.click
      # txt.send_keys('12345')

      # Find element above 
      # above = driver.find_element(relative: {above: ref})
      # above.send_keys('123456')
    ensure
      # driver.quit
    end
  end
end
