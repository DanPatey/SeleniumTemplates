require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'Newsletter Lightbox' do
  it 'Should Appear' do
    url = '/articles/1285046-bruce-bochy-breaking-down-the-san-francisco-giants-manager'
    @driver.goto url
    wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    wait.until { @driver.find_element(:id => 'lightbox_engage') }

    element = @driver.find_element(:id, 'lightbox_engage')
    element.find_element(:id, 'engagement-email').should_not be_nil
    element.find_element(:id, 'engagement-submit').should_not be_nil
    element = @driver.find_element(:id, 'lightbox-engage-footer')
#    @driver.find_element(:class, 'decline-engagement').click
  end
end

