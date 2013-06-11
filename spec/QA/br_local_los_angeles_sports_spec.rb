require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The Los Angeles Page' do
  it 'Should Have All Suitable Links' do
    url ='/los-angeles-sports'
    @driver.goto url
    @driver.title.should include("Bleacher Report Local Los Angeles Edition")

    #################################
    #			header				#
    #################################
    @driver.find_element(:id, 'powered-by').should_not be_nil

    #################################
    #			content				#
    #################################
    element = @driver.find_element(:id, 'lead-story')

    @driver.find_element(:id, 'most-popular-module').text.should include("MOST POPULAR")
    @driver.find_element(:id, 'most-commented-module').text.should include("MOST COMMENTED")

    #################################
    #			sidebar				#
    #################################
    @driver.find_element(:id, 'featured-columnists').text.should include("FEATURED COLUMNISTS")

    element = @driver.find_element(:id, 'siteOverview')
    size = element.size
    size.height.should == 55 #52
    size.width.should == 970 #980
    element.find_element(:link, 'Corrections').should_not be_nil
    element.find_element(:link, 'Horoscopes').should_not be_nil
    element.find_element(:link, 'Media Kit').should_not be_nil
    element.find_element(:link, 'About Us').should_not be_nil
    element.find_element(:link, 'Contact Us').should_not be_nil
    element.find_element(:link, 'Site Map').should_not be_nil

    element = @driver.find_element(:id, 'footerlogo')
    size = element.size
    element.find_element(:xpath, "//img[@src='http://www.latimes.com/media/graphic/2010-02/52101671.png']").should_not be_nil

    element = @driver.find_element(:id, 'footertext')
    size = element.size
    element.find_element(:link, 'Terms of Service').should_not be_nil
    element.find_element(:link, 'Privacy Policy').should_not be_nil
    element.text.should include(" | Los Angeles Times, 202 West 1st Street, Los Angeles, California, 90012 | Copyright 2012")
    @driver.find_element(:link, 'A Tribune Web site').should_not be_nil
  end
end
