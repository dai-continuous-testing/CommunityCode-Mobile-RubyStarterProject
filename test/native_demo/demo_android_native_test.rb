require 'test/unit'
require 'appium_lib_core'
require_relative '../test_utils'

class DemoAndroidNativeTest < Test::Unit::TestCase
  def setup
    opts = {
      capabilities: {
        platformName: 'android',
        automationName: 'UiAutomator2',
        app: 'cloud:com.experitest.ExperiBank/.LoginActivity',
        appPackage: 'com.experitest.ExperiBank',
        appActivity: '.LoginActivity',
        'digitalai:testName': 'Android Native Demo',
        'digitalai:accessKey': TestUtils.get_access_key,
        'digitalai:deviceQuery': "@os='android' and @category='PHONE'",
        'digitalai:appiumVersion': "2.18.0",
      },
      appium_lib: {
        server_url: TestUtils.get_url,
      }
    }
    @core = Appium::Core.for(opts)
    @driver = @core.start_driver
  end

  def test_AndroidNativeDemo
    @driver.find_element(:id, "com.experitest.ExperiBank:id/usernameTextField").send_keys('company')
    @driver.find_element(:id, "com.experitest.ExperiBank:id/passwordTextField").send_keys('company')
    @driver.find_element(:id, "com.experitest.ExperiBank:id/loginButton").click
    @driver.find_element(:id, "com.experitest.ExperiBank:id/makePaymentButton").click
    @driver.find_element(:id, "com.experitest.ExperiBank:id/phoneTextField").send_keys('0541234567')
    @driver.find_element(:id, "com.experitest.ExperiBank:id/nameTextField").send_keys('Jon Snow')
    @driver.find_element(:id, "com.experitest.ExperiBank:id/amountTextField").send_keys('50')
    @driver.find_element(:id, "com.experitest.ExperiBank:id/countryTextField").send_keys('Switzerland')
    @driver.find_element(:id, "com.experitest.ExperiBank:id/sendPaymentButton").click
    @driver.find_element(:id, "android:id/button1").click
  end

  def teardown
    @driver&.quit
  end
end