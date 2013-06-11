require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'Article Admin Feature' do
  it 'Should Be Working Properly' do

    email="DPatey@BleacherReport.com"
    password="burton168!^*"
    url = '/articles/1285046-bruce-bochy-breaking-down-the-san-francisco-giants-manager'
    @driver.goto url
    @driver.login(email, password)

    wait = Selenium::WebDriver::Wait.new(:timeout => 60) # seconds
    wait.until { @driver.find_element(:class, 'admin-actions') }

    @driver.find_element(:class, 'dropdown-arrow').click

    wait = Selenium::WebDriver::Wait.new(:timeout => 60) # seconds
    wait.until { @driver.find_element(:link_text, "Article Admin") }

    # Enter article admin:
    @driver.find_element(:link_text, "Article Admin").click

    @driver.page_source.scan("Message to Editors").should_not be_nil
    @driver.page_source.scan("Scoring").should_not be_nil
    @driver.page_source.scan("Author").should_not be_nil
    @driver.page_source.scan("Hook").should_not be_nil
    @driver.page_source.scan("Editing").should_not be_nil
    @driver.page_source.scan("1285046-bruce-bochy-breaking-down-the-san-francisco-giants-manager").should_not be_nil
  end
end
