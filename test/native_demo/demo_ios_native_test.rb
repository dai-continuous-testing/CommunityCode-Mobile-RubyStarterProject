require 'test/unit'
require 'appium_lib_core'
require_relative '../test_utils'

class DemoIOSNativeTest < Test::Unit::TestCase
  def setup
    opts = {
      capabilities: {
        platformName: 'ios',
        automationName: 'XCUITest',
        app: 'cloud:com.experitest.ExperiBank',
        bundleId: 'com.experitest.ExperiBank',
        'digitalai:testName': 'iOS Native Demo',
        'digitalai:accessKey': TestUtils.get_access_key,
        'digitalai:deviceQuery': "@os='ios' and @category='PHONE'",
        'digitalai:appiumVersion': "2.18.0"
      },
      appium_lib: {
        server_url: TestUtils.get_url,
      }
    }

    @core = Appium::Core.for(opts)
    @driver = @core.start_driver
  end

  def test_iOSNativeDemo
    @driver.find_element(:xpath, "//*[@name='usernameTextField']").send_keys('company')
    @driver.find_element(:xpath, "//*[@name='passwordTextField']").send_keys('company')
    @driver.find_element(:xpath, "//*[@name='loginButton']").click
    @driver.find_element(:xpath, "//*[@name='makePaymentButton']").click
    @driver.find_element(:xpath, "//*[@name='phoneTextField']").send_keys('0541234567')
    @driver.find_element(:xpath, "//*[@name='nameTextField']").send_keys('Jon Snow')
    @driver.find_element(:xpath, "//*[@name='amountTextField']").send_keys('50')
    @driver.find_element(:xpath, "//*[@name='countryButton']").click
    @driver.find_element(:xpath, "//*[@name='Switzerland']").click
    @driver.find_element(:xpath, "//*[@name='sendPaymentButton']").click
    @driver.find_element(:xpath, "//*[@name='Yes']").click
  end

  def teardown
    @driver&.quit
  end
end