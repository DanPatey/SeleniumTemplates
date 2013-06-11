# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "External Articles" do
  it "should have full functionality on mobile devices" do
    url = "/articles/1285401-olympic-sprinter-kim-collins-sent-home-for-visiting-wife-children"
    @driver.goto url
    @driver.title.should include("Olympic sprinter Kim Collins sent home for visiting wife, children")

    #header
    @driver.find_element(:id, 'logo').should_not be_nil
    @driver.find_element(:id, 'handle').should_not be_nil

    #Get through the Android App Roadblock
    @driver.find_element(:class, "no-thanks").click

    #content
    @driver.find_element(:id, "article-header").should_not be_nil
    @driver.find_element(:css => '.article-body > div:nth-of-type(1)').should_not be_nil
    @driver.page_source.scan("comments").should_not be_nil
    @driver.page_source.scan("Load more posts").should_not be_nil
    @driver.page_source.scan("copyright").should_not be_nil

    #Continue on with our article tests
    @driver.find_element(:css => '.article-body > div:nth-of-type(1) > a:nth-of-type(1)').click
  end
end
