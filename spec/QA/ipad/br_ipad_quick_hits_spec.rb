# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Quick Hits" do
  it "should be able to be read on mobile devices" do
    url = "/articles/1336722-wwe-night-of-champions-2012-results-john-cena-cm-punk-and-live-updates"
    @driver.goto url

    #Get through the iPad App Roadblock
    begin
        @driver.find_element(:class, "no-thanks").click
    rescue Selenium::WebDriver::Error::ElementNotVisibleError ,Selenium::WebDriver::Error::NoSuchElementError => e
        puts "Download App Link Not Shown"
    end
    @driver.title.should include("Bleacher Report")
    #################################
    #     content       #
    #################################
    @driver.find_element(:id, "logo").should_not be_nil
    @driver.find_element(:id, "page-header").should_not be_nil
    @driver.find_element(:css => '.article-title > h1:nth-of-type(1)').should_not be_nil
    #@driver.find_element(:css => '#container > div:nth-of-type(1) > div:nth-of-type(3) > img:nth-of-type(1)').should_not be_nil
    @driver.find_element(:css => '#article-info').should_not be_nil
    @driver.find_element(:css => '.bottom-swipe-next').should_not be_nil
    #@driver.find_element(:css => '.article-body > div:nth-of-type(1) > div:nth-of-type(1)').should_not be_nil
    #@driver.find_element(:css => '.article-body > div:nth-of-type(1) > div:nth-of-type(3) > div:nth-of-type(1) > img:nth-of-type(1)').should_not be_nil
    #@driver.find_element(:css => '.article-body > div:nth-of-type(1) > div:nth-of-type(3) > p:nth-of-type(1)').should_not be_nil

    #@driver.find_element(:css => '.article-body > div:nth-of-type(3) > div:nth-of-type(1)').should_not be_nil
    #@driver.find_element(:css => '.article-body > div:nth-of-type(3) > div:nth-of-type(3) > div:nth-of-type(1) > img:nth-of-type(1)').should_not be_nil
    #@driver.find_element(:css => '.article-body > div:nth-of-type(3) > div:nth-of-type(3) > p:nth-of-type(1)').should_not be_nil

    #@driver.find_element(:css => '.article-body > div:nth-of-type(5) > div:nth-of-type(1)').should_not be_nil
    #@driver.find_element(:css => '.article-body > div:nth-of-type(5) > div:nth-of-type(3) > div:nth-of-type(1) > img:nth-of-type(1)').should_not be_nil
    #@driver.find_element(:css => '.article-body > div:nth-of-type(5) > div:nth-of-type(3) > p:nth-of-type(1)').should_not be_nil

    @driver.page_source.scan("related_content").should_not be_nil
    @driver.page_source.scan("comments").should_not be_nil
    @driver.page_source.scan("More Articles You'll Like").should_not be_nil
    @driver.page_source.scan("Load more posts").should_not be_nil
    @driver.page_source.scan("copyright").should_not be_nil
  end
end
