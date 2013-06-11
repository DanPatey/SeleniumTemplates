# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "External Articles" do
  it "should have full functionality on mobile devices" do
    url = "/articles/1285401-olympic-sprinter-kim-collins-sent-home-for-visiting-wife-children"
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
#    @driver.find_element(:css => '.article-body > div:nth-of-type(1)').should_not be_nil

#    @driver.page_source.scan("comments").should_not be_nil
#    @driver.page_source.scan("Load more posts").should_not be_nil
#    @driver.page_source.scan("copyright").should_not be_nil

#    @driver.find_element(:css => '.article-body > div:nth-of-type(1) > a:nth-of-type(1)').click
#    sleep 5
#    @driver.find_element(:class, "entrytitle").text.should include("Olympic sprinter Kim Collins sent home for visiting wife and children at hotel")
#    @driver.find_element(:class, "entrybody").should_not be_nil
  end
end
