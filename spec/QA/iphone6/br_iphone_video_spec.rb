# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Videos" do
  it "should have full functionality on mobile devices" do
    url = "/articles/1294582-london-2012-grading-team-usas-gold-medal-win-over-spain"
    @driver.goto url
    @driver.title.should include("London 2012: Grading Team USA's Gold-Medal Win over Spain")

    #Header
#    @driver.find_element(:id, 'page-header').text.should include("Olympics")
#    @driver.find_element(:id, 'logo').should_not be_nil
#    @driver.find_element(:id, 'handle').should_not be_nil

    #Content
#    @driver.find_element(:id, "article-header").should_not be_nil
#    @driver.find_element(:css => '.article-body > p:nth-of-type(1)').should_not be_nil
#    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(3) > div:nth-of-type(1) > div:nth-of-type(1) > video:nth-of-type(1)').should_not be_nil
#    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(3) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) > img:nth-of-type(1)').should_not be_nil

    #Play video
#    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(3) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) > img:nth-of-type(2)').click

    sleep 2

#    @driver.page_source.scan("related_content").should_not be_nil
#    @driver.page_source.scan("comments").should_not be_nil
#    @driver.page_source.scan("More Articles You'll Like").should_not be_nil
#    @driver.page_source.scan("Load more posts").should_not be_nil
#    @driver.page_source.scan("copyright").should_not be_nil
  end
end
