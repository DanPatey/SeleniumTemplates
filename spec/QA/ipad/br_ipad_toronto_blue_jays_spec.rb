# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Toronto Blue Jays" do
  it "should have a redesign team page" do
    url = "/toronto-blue-jays"
    @driver.goto url

    #Get through the iPad App Roadblock
    begin
        @driver.find_element(:class, "no-thanks").click
    rescue Selenium::WebDriver::Error::ElementNotVisibleError , Selenium::WebDriver::Error::NoSuchElementError => e
        puts "Download App Link Not Shown"
    end
    @driver.title.should include("Bleacher Report")
    ##########POPUP##################
    @driver.find_element(:id, 'fans-on-facebook-module')
    @driver.find_element(:id, 'content').should_not be_nil
    @driver.find_element(:id, 'sidebar').should_not be_nil
    #################################
    #     header                    #
    #################################

    @driver.find_element(:id, 'header').should_not be_nil
    @driver.find_element(:id, 'logo').should_not be_nil
    @driver.find_element(:id, 'handle').should_not be_nil
    @driver.find_element(:id, 'page-header').should_not be_nil

    #Get through the iPad App Roadblock
    #@driver.find_element(:class, "no-thanks").click

    #################################
    #     content       #
    #################################
    @driver.find_element(:css => '#stream-module > li:nth-of-type(1)').should_not be_nil
    @driver.find_element(:css => '#stream-module > li:nth-of-type(2)').should_not be_nil
    @driver.find_element(:css => '#stream-module > li:nth-of-type(3)').should_not be_nil
    @driver.find_element(:css => '#stream-module > li:nth-of-type(4)').should_not be_nil
    @driver.find_element(:css => '#stream-module > li:nth-of-type(5)').should_not be_nil
    @driver.find_element(:css => '#stream-module > li:nth-of-type(6)').should_not be_nil
    @driver.find_element(:css => '#stream-module > li:nth-of-type(7)').should_not be_nil
    @driver.find_element(:css => '#stream-module > li:nth-of-type(8)').should_not be_nil
    @driver.find_element(:css => '#stream-module > li:nth-of-type(9)').should_not be_nil
    @driver.find_element(:css => '#stream-module > li:nth-of-type(10)').should_not be_nil

    @driver.page_source.scan("© 2012 Bleacher Report, Inc. All Rights Reserved.").should_not be_nil
  end
end
