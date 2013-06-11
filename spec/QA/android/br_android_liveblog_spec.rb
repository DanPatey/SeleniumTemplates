# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Live Blogs" do
  it "should be able to be read on mobile devices" do
    url = "/articles/1285432-usa-vs-china-womens-basketball-live-score-stats-recap"
    @driver.goto url

    #################################
    #     header                    #
    #################################
    @driver.find_element(:id, 'logo').should_not be_nil
    @driver.find_element(:id, 'handle').should_not be_nil

    #Get through the Android App Roadblock
#    @driver.find_element(:class, "no-thanks").click
    #################################
    #     content       #
    #################################
    @driver.find_element(:id, "article-header").should_not be_nil
    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(3) > img:nth-of-type(1)').should_not be_nil
    @driver.find_element(:css => '.article-body > p:nth-of-type(1)')
    @driver.page_source.scan("related_content").should_not be_nil
    @driver.page_source.scan("comments").should_not be_nil

    #Get through the Android App Roadblock
    @driver.find_element(:class, "no-thanks").click

    @driver.find_element(:css => '.article-body > div:nth-of-type(1) > div:nth-of-type(3) > p:nth-of-type(1)').should_not be_nil
    @driver.find_element(:css => '.article-body > div:nth-of-type(3) > div:nth-of-type(3) > p:nth-of-type(1)').should_not be_nil
    @driver.find_element(:css => '.article-body > div:nth-of-type(5) > div:nth-of-type(3) > p:nth-of-type(1)').should_not be_nil

    @driver.page_source.scan("More Articles You'll Like").should_not be_nil
    @driver.page_source.scan("Load more posts").should_not be_nil
    @driver.page_source.scan("copyright").should_not be_nil
  end
end
