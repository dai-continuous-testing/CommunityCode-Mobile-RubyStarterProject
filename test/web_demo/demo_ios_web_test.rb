require 'test/unit'
require 'appium_lib_core'
require_relative '../test_utils'

class DemoIosWebTest < Test::Unit::TestCase
  def setup
    opts = {
      capabilities: {
        platformName: 'ios',
        browserName: 'safari',
        'digitalai:testName': 'iOS Web Demo',
        'digitalai:accessKey': TestUtils.get_access_key,
        'digitalai:deviceQuery': "@os='ios'",
        'digitalai:appiumVersion': "2.18.0"
      },
      appium_lib: {
        server_url: TestUtils.get_url,
      }
    }

    @core = Appium::Core.for(opts)
    @driver = @core.start_driver
  end

  def test_iOSWebDemo
    @driver.manage.timeouts.implicit_wait = 10
    @driver.get("https://demo-bank.ct.digital.ai/")
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { @driver.find_element(:id, 'login') }

    @driver.find_element(:xpath, "//*[@data-auto='username']//input").send_keys('company')
    @driver.find_element(:xpath, "//*[@data-auto='password']//input").send_keys('company')
    @driver.find_element(:xpath, "//*[@data-auto='login']").click

    @driver.find_element(:xpath, "//*[@data-auto='transfer-funds']").click

    @driver.find_element(:xpath, "//input[@name='NAME']").send_keys('John')
    @driver.find_element(:xpath, "//input[@name='PHONE']").send_keys('1-234-5678')
    @driver.find_element(:xpath, "//input[@name='AMOUNT']").send_keys('1000')
    @driver.find_element(:xpath, "//*[@data-auto='country']").click
    @driver.find_element(:xpath, "//*[text()='India']").click
    @driver.find_element(:xpath, "//*[@data-auto='transfer-button']").click
  end

  def teardown
    @driver&.quit
  end
end