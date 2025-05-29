# Community Code - Mobile Ruby Starter Project
Use this project to get started writing tests with Continuous Testing Cloud using Ruby.


1. Clone the sample project from [CommunityCode-Mobile-RubyStarterProject](https://github.com/ExperitestOfficial/CommunityCode-Mobile-RubyStarterProject) repository and navigate to the code directory as shown below:

```bash
git clone https://github.com/ExperitestOfficial/CommunityCode-Mobile-RubyStarterProject
cd CommunityCode-Mobile-RubyStarterProject
```
2. Set up authentication. Update the following parameters in [config.yml](config.yml):
* url - URL for the cloud the test runs on. For example, https://company.experitest.com/
* accessKey -  Personal authentication key. To learn how to obtain a key, see [Obtaining Access Key](https://docs.digital.ai/bundle/TE/page/obtaining_access_key.html).

## Running Tests
This project requires Ruby 3.1 and higher.

In the terminal, install all project gems by running:
```bash
bundle install
```
To run all tests in this project, execute to following command line: 

```bash
ruby -Itest test/run_tests.rb
```

## Upload Application to the Cloud

The example tests in native_demo use a demo application.
To upload your own application to cloud:
1. Log in to Continuous Testing Cloud using a browser.
2. Click Applications.
3. Click Upload.
4. Click the application file to upload.

In your tests, change *com.experitest.ExperiBank* (and activity if needed) in desired capabilities for your application, in the following lines:

* For Android:
```
app: 'cloud:com.experitest.ExperiBank/.LoginActivity',
appPackage: 'com.experitest.ExperiBank',
appActivity: '.LoginActivity',
```
* For iOS:
```
app: 'cloud:com.experitest.ExperiBank',
bundleId: 'com.experitest.ExperiBank',
```
For more ways to upload your application to the cloud, see [Native Applications Testing](https://docs.digital.ai/bundle/TE/page/native_applications_testing.html).

## Desired Capabilities

Continuous Cloud Testing expands Appium's capabilities and allows better control over the device and test.
In these examples we use the desired capabilities to set the test name and choose devices to run on, as well as set the application as shown above.
See [Capabilities in Appium Based Tests](https://docs.digital.ai/bundle/TE/page/capabilties_in_appium_based_tests.html) to learn how to customize the desired capabilities for your tests.

## Documentation
To find out more about Continuous Cloud Testing usage, features, and best practices, visit our online [documentation](https://docs.digital.ai/bundle/TE/page/test_execution_home.html). 

## Support
If you encounter an issue that is not covered here or in our online documentation, contact us at [support@digital.ai](mailto:support@digital.ai).