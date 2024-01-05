require 'selenium-webdriver'
require 'spec_helper'

RSpec.describe 'Using Selenium for testing Relative selectors' do
  it 'uses eight components' do
    driver = Selenium::WebDriver.for :chrome
    driver.manage.timeouts.implicit_wait = 500
    driver.get('https://www.selenium.dev/selenium/web/web-form.html')

    password_locator = { relative: { name: 'my-datalist', left: { name: 'my-password' } } }
    pass = driver.find_element(password_locator)
    # pass.send_keys('New York')
  end
end
