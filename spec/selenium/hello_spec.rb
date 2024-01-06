require 'selenium-webdriver'
require 'spec_helper'

RSpec.describe 'Using Selenium' do
  it 'uses eight components' do

    driver = Selenium::WebDriver.for :chrome
    driver.manage.timeouts.implicit_wait = 500
    driver.get('https://www.selenium.dev/selenium/web/web-form.html')

    title = driver.title
    expect(title).to eq('Web form')

    driver.manage.timeouts.implicit_wait = 500

    text_box = driver.find_element(css: '#my-text-id')
    # submit_button = driver.find_element(class: 'btn-outline-primary')
    # submit_button = driver.find_element(css: "button[type=submit]")
    submit_button = driver.find_element(:xpath, "//button[@type='submit']")

    text_box.send_keys('Selenium')
    submit_button.click

    message = driver.find_element(id: 'message')
    value = message.text
    expect(value).to eq('Received!')

    driver.quit
  end
end