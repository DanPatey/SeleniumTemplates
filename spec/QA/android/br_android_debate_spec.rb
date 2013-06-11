# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Debate Articles" do
  it "should be able to be read on mobile devices" do
    url = "/articles/1293254-debate-what-should-be-the-primary-back-with-mathews-out"
    @driver.goto url
    @driver.title.should include("Bleacher Report")

    #################################
    #     header                    #
    #################################
    @driver.find_element(:id, 'logo').should_not be_nil
    @driver.find_element(:id, 'handle').should_not be_nil

    #Get through the Android App Roadblock
    @driver.find_element(:class, "no-thanks").click

    #################################
    #     content       #
    #################################
    @driver.find_element(:id, "top-comments").should_not be_nil
    @driver.page_source.scan("Debate Zone").should_not be_nil

    @driver.find_element(:css => '#top-level-comments > span:nth-of-type(1) > dt:nth-of-type(1) > span:nth-of-type(2)').should_not be_nil
    @driver.find_element(:css => '#top-level-comments > span:nth-of-type(1) > dd:nth-of-type(1) > div:nth-of-type(1) > p:nth-of-type(1)').should_not be_nil
    @driver.find_element(:css => '#top-level-comments > span:nth-of-type(3) > dt:nth-of-type(1) > span:nth-of-type(2)').should_not be_nil
    @driver.find_element(:css => '#top-level-comments > span:nth-of-type(3) > dd:nth-of-type(1) > div:nth-of-type(1) > p:nth-of-type(1)').should_not be_nil
    @driver.find_element(:css => '#top-level-comments > span:nth-of-type(5) > dt:nth-of-type(1) > span:nth-of-type(2)').should_not be_nil
    @driver.find_element(:css => '#top-level-comments > span:nth-of-type(5) > dd:nth-of-type(1) > div:nth-of-type(1) > p:nth-of-type(1)').should_not be_nil

    @driver.page_source.scan("related_content").should_not be_nil
    @driver.page_source.scan("comments").should_not be_nil
    @driver.page_source.scan("More Articles You'll Like").should_not be_nil
    @driver.page_source.scan("Load more posts").should_not be_nil
    @driver.page_source.scan("copyright").should_not be_nil
  end
end
