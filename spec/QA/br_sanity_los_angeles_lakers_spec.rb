# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "LALakers" do
  it "should have a la lakers page" do
    url = "/"
    @driver.goto url

    @driver.hover(:link, 'NBA') do
      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:link => "LA Lakers") }

      @driver.find_element(:link, 'LA Lakers').click
    end

    #################################
    #     header        #
    #################################
    @driver.find_element(:link, 'NBA').should_not be_nil
    @driver.find_element(:link, 'LA Lakers').should_not be_nil
    @driver.find_element(:link, 'Home').should_not be_nil
    @driver.find_element(:link, 'Team Stream').should_not be_nil
    @driver.find_element(:link, 'Archives').should_not be_nil
    @driver.find_element(:link, 'Top Writers').should_not be_nil
    @driver.find_element(:link, 'Shop').should_not be_nil
    @driver.find_element(:link, 'Newsletter').should_not be_nil

    #################################
    #     content       #
    #################################
    @driver.find_element(:id, 'lead-story').should_not be_nil
    @driver.find_element(:id, 'team-stream-module').text.should include("TEAM STREAM ™")
    @driver.page_source.scan("COMMUNITY PICKS").should_not be_nil
    @driver.page_source.scan("AROUND THE NBA").should_not be_nil

    #################################
    #     sidebar       #
    #################################
    element = @driver.find_element(:id, 'fans-on-facebook-module')
    element.find_element(:css, 'span.facebook-like').should_not be_nil

#    @driver.find_element(:id, 'BScompanion').should_not be_nil
    element = @driver.find_element(:id, 'featured-columnists').text.should include("FEATURED COLUMNISTS")

    element = @driver.find_element(:id, 'twitter-sidebar')
    element.find_element(:css, 'span[class="br-logo"]').should_not be_nil
    element.text.should include("Get exclusive coverage")
    element.find_element(:link, 'Like us on Facebook').should_not be_nil
    element.find_element(:link, 'Follow @BleacherReport').should_not be_nil
    element.find_element(:link, 'Download Team Stream App').should_not be_nil
    element.find_element(:link, 'Add to circles on Google+').should_not be_nil

    element = @driver.find_element(:id, 'article-newsletter-side-module')
    element.find_element(:id, 'newsletter-email').should_not be_nil
    element.find_element(:id, 'newsletter-submit').should_not be_nil

    community_module = @driver.find_element(:id, 'community-members')
    community_module.find_element(:css => "h3").text.should == "COMMUNITY"
    community_module.find_element(:id, 'community-members-button').should_not be_nil
  end
end
