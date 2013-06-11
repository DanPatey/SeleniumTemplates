# encoding: utf-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The Homepage' do
  it 'Should Have Relevent Links' do
  url = '/'
  @driver.goto url
  @driver.title.should include("Bleacher Report | Entertaining sports news, photos and slideshows")

  #################################
  #     hat                       #
  #################################
  @driver.find_element(:id, 'search-container').should_not be_nil
  @driver.find_element(:id, 'login2').should_not be_nil
  @driver.find_element(:id, 'signup').should_not be_nil
  @driver.find_element(:id, 'facebook-connect').should_not be_nil

  #################################
  #     header                    #
  #################################
  @driver.find_element(:id, 'header-logo').should_not be_nil
  @driver.find_element(:link, 'Home').should_not be_nil
  @driver.find_element(:link, 'NFL').should_not be_nil
  @driver.find_element(:link, 'CFB').should_not be_nil
  @driver.find_element(:link, 'MLB').should_not be_nil
  @driver.find_element(:link, 'NBA').should_not be_nil
  @driver.find_element(:link, 'NHL').should_not be_nil
  @driver.find_element(:link, 'CBB').should_not be_nil
  @driver.find_element(:link, 'Soccer').should_not be_nil
  @driver.find_element(:link, 'UFC').should_not be_nil
  @driver.find_element(:link, 'WWE').should_not be_nil
  @driver.find_element(:link, 'More').should_not be_nil
  @driver.find_element(:link, 'Swagger').should_not be_nil
  @driver.find_element(:link, 'Video').should_not be_nil
  @driver.find_element(:link, 'Blogs').should_not be_nil
  @driver.find_element(:link, 'My Teams').should_not be_nil
  
  #################################
  #     footer                    #
  #################################
  begin
    modules = @driver.find_elements(:class => "footer-module")
    column1_titles = modules[0].find_elements(:css => "h4")
      column1_titles[0].text.should == "GET B/R IN YOUR INBOX"
      column1_titles[1].text.should == "MOBILE"
    column2_titles = modules[1].find_elements(:css => "h4")
      column2_titles[0].text.should == "SPORTSWRITER ON THE WAY UP?"
      column2_titles[1].text.should == "FOLLOW B/R"
      column3_title = modules[2].find_element(:css => "h4")
    
    modules[2].find_element(:css => "h4").text.should == "POPULAR TOPICS"
    modules[2].find_elements(:css => "li > a").length.should > 0

    modules[3].find_element(:css => "a").attribute("href").should == "http://www.turner.com/"

    # Verify Toe of Footer
    toe_links = @driver.find_elements(:css => "ul#toes > li")
    toe_links_text = ['About', 'Blog', 'Contact Us', 'Careers', 'Community Guidelines', 'Privacy', 'Terms of Use']
    toe_links.each_with_index do | link, position | 
      raise "A link in the toe of footer has changed" unless link.text == toe_links_text[position]
    end
  rescue Selenium::WebDriver::Error::NoSuchElementError => e
    raise "Footer Elements Have Changed"
  end
  end
end
