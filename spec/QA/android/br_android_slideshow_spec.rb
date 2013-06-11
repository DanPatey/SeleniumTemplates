# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Slideshows" do
  it "should be able to be read on mobile devices" do
    url = "/articles/1267155-olympic-basketball-2012-predicting-outcomes-of-every-usa-mens-basketball-game"
    @driver.goto url

    #Header
    @driver.find_element(:id, 'page-header').text.should include("")
    @driver.find_element(:id, 'logo').should_not be_nil
    @driver.find_element(:id, 'handle').should_not be_nil

    #Get through the Android App Roadblock
    @driver.find_element(:class, "no-thanks").click

    #Content
    @driver.find_element(:id, "article-header").should_not be_nil
    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(1) > img:nth-of-type(1)')
    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(2)').should_not be_nil
    @driver.page_source.scan("related_content").should_not be_nil
    @driver.page_source.scan("comments").should_not be_nil

    #Begin slideshow
    @driver.find_element(:css => '#slide-header > div:nth-of-type(1) > div:nth-of-type(2)').click
    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(1) > img:nth-of-type(1)').should_not be_nil
    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(2)').should_not be_nil

    #Next slide
    @driver.find_element(:css=> '#slide-header > div:nth-of-type(1) > div:nth-of-type(2)').click
  end
end
