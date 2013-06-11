# encoding: utf-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The Golf Page' do
  it 'Should Have All Relevent Links' do
    url = '/golf'
    @driver.goto url

    element = @driver.find_element(:link, 'More')
    @driver.mouse.move_to element
    wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    wait.until { @driver.find_element(:link => "Golf") }

    #################################
    #			header 				#
    #################################
    @driver.find_element(:id, 'page-header').text.should include("Golf")

    #################################
    #			content				#
    #################################
    @driver.page_source.scan("lead-story").should_not be_nil
    @driver.page_source.scan("Lists/Rankings").should_not be_nil
    @driver.page_source.scan("More Featured Stories").should_not be_nil
    @driver.page_source.scan("Breaking News").should_not be_nil
    @driver.page_source.scan("Opinion").should_not be_nil
    @driver.page_source.scan("Previews/Predictions").should_not be_nil
    @driver.page_source.scan("Most Commented").should_not be_nil
    @driver.page_source.scan("Top Writers").should_not be_nil

    #################################
    #			sidebar				#
    #################################
    
    element = @driver.find_element(:id, 'twitter-sidebar')
    element.text.should include("Get exclusive coverage")
    element.find_element(:link, 'Like us on Facebook').should_not be_nil
    element.find_element(:link, 'Follow @BleacherReport').should_not be_nil
    element.find_element(:link, 'Download Team Stream App').should_not be_nil
    element.find_element(:link, 'Add to circles on Google+').should_not be_nil

    element = @driver.find_element(:id, 'article-newsletter-side-module')
    element.find_element(:id, 'newsletter-email').should_not be_nil
    element.find_element(:id, 'newsletter-submit').should_not be_nil

#    @driver.find_element(:id, 'br-ad-wrapper').should_not be_nil
  end
end
