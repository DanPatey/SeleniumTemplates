# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Articles" do
  it "should be able to be read on mobile devices" do
    url = "/articles/1271004-ranking-the-top-nfl-mvp-candidates-for-the-2012-season"
    email="Dpatey@BleacherReport.com"
    password="burton168!^*"
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
    #     comments      #
    #################################

#    @driver.find_element(:css => '#article-container > div:wrapper border-box > class:comments-count comments-count-top js-open-comments').click
#    @driver.find_element(:id, 'close-comments').click

    #Related Articles Slideshow
#    @driver.find_element(:id, 'related-content').should_not be_nil
  end
end
