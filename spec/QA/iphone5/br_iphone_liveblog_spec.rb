# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Live Blogs" do
  it "should be able to be read on mobile devices" do
    url = "/articles/1285432-usa-vs-china-womens-basketball-live-score-stats-recap"
    @driver.goto url
    @driver.title.should include("Bleacher Report")

    #################################
    #     content       #
    #################################
    @driver.find_element(:class, 'border-box').should_not be_nil
    @driver.find_element(:class, 'article-title').should_not be_nil
    @driver.find_element(:id, 'article-container').should_not be_nil
    @driver.find_element(:class, 'article-body').should_not be_nil

    #################################
    #     content       #
    #################################
#    @driver.find_element(:id, "article-header").should_not be_nil
#    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(3) > img:nth-of-type(1)').should_not be_nil
#    @driver.find_element(:css => '.article-body > p:nth-of-type(1)')

#    @driver.page_source.scan("related_content").should_not be_nil
#    @driver.page_source.scan("comments").should_not be_nil

#    @driver.find_element(:css => '.article-body > div:nth-of-type(1) > div:nth-of-type(3) > p:nth-of-type(1)').should_not be_nil
#    @driver.find_element(:css => '.article-body > div:nth-of-type(3) > div:nth-of-type(3) > p:nth-of-type(1)').should_not be_nil
#    @driver.find_element(:css => '.article-body > div:nth-of-type(5) > div:nth-of-type(3) > p:nth-of-type(1)').should_not be_nil

#    @driver.page_source.scan("More Articles You'll Like").should_not be_nil
#    @driver.page_source.scan("Load more posts").should_not be_nil
#    @driver.page_source.scan("copyright").should_not be_nil
  end
end
