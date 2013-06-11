# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Slideshows" do
  it "should be able to be read on mobile devices" do
    url = "/articles/1361569-philadelphia-eagles-instructions-how-to-play-the-running-game"
    @driver.goto url

    #Get through the iPad App Roadblock
    begin
        @driver.find_element(:class, "no-thanks").click
    rescue Selenium::WebDriver::Error::ElementNotVisibleError , Selenium::WebDriver::Error::NoSuchElementError => e
        puts "Download App Link Not Shown"
    end

    @driver.title.should include("Bleacher Report")
    #Content
    @driver.find_element(:id, 'header').should_not be_nil
    @driver.find_element(:id, 'logo').should_not be_nil

    @driver.find_element(:class, "full-name").should_not be_nil
    @driver.find_element(:id, "article-info").should_not be_nil
    @driver.find_element(:id, "page-header").should_not be_nil
    #@driver.find_element(:class, "team-page.philadelphia-eagles.with-logo").should_not be_nil
    #@driver.find_element(:css => '.body > img').should_not be_nil
    #@driver.find_element(:css => '#container > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(1) > img')
    #@driver.find_element(:css => '#container > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(2)').should_not be_nil
    @driver.page_source.scan("related_content").should_not be_nil
    @driver.page_source.scan("comments").should_not be_nil

    #Get through the iPad App Roadblock
    #@driver.find_element(:class, "no-thanks").click

    #Begin slideshow
    @driver.find_element(:id, 'swipe-next-slideshow').click
    #@driver.find_element(:css => '#slide-header > div:nth-of-type(1) > div:nth-of-type(2)').click
    #@driver.find_element(:css => '#container > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) > h1)').should_not be_nil
    @driver.find_element(:class, 'article-title');
    @driver.find_element(:css => '#container > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(2) > p:nth-of-type(1)').should_not be_nil

    #Next slide
    @driver.find_element(:class, 'bottom-swipe-next').should_not be_nil
  end
end
