# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Toronto Blue Jays" do
  it "should have a redesign team page" do
    url = "/toronto-blue-jays"
    @driver.goto url
    @driver.title.should include("Bleacher Report")

    #################################
    #     header                    #
    #################################
    @driver.find_element(:id, 'page-header').text.should include("Blue Jays")
    @driver.find_element(:id, 'logo').should_not be_nil
    @driver.find_element(:id, 'handle').should_not be_nil

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
