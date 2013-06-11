# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Slideshows" do
  it "should be able to be read on mobile devices" do
    url = "/articles/1521247-biggest-signs-that-dwight-howard-will-remain-with-la-lakers-long-term"
    @driver.goto url
    @driver.title.should include("Bleacher Report")


    #################################
    #     content       #
    #################################
    @driver.find_element(:class, 'border-box').should_not be_nil
    @driver.find_element(:class, 'article-title').should_not be_nil
    @driver.find_element(:id, 'article-container').should_not be_nil
    @driver.find_element(:class, 'article-body').should_not be_nil

    #Content
#    @driver.find_element(:id, "article-header").should_not be_nil
#    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(1) > img:nth-of-type(1)')
#    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(2)').should_not be_nil
#    @driver.page_source.scan("related_content").should_not be_nil
#    @driver.page_source.scan("comments").should_not be_nil

    #Comments box
#    @driver.find_element(:class, 'comments-count comments-count-top js-open-comments').click

    #Begin slideshow
#    @driver.find_element(:css => '#slide-header > div:nth-of-type(1) > div:nth-of-type(2)').click
#    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(1) > img:nth-of-type(1)').should_not be_nil
#    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(2)').should_not be_nil

    #Next slide
#    @driver.find_element(:css=> '#slide-header > div:nth-of-type(1) > div:nth-of-type(2)').click
  end
end
