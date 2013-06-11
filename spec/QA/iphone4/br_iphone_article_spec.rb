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
    @driver.find_element(:id, "article-header").should_not be_nil

    element = @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(3) > img:nth-of-type(1)')

    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(4)').should_not be_nil
    @driver.find_element(:css => '.article-body > div:nth-of-type(6)').should_not be_nil
    @driver.find_element(:class, 'poll-question').text.should include("Who will win the 2012 NFL MVP Award?")
    @driver.find_element(:css => '.poll > form:nth-of-type(1) > label:nth-of-type(1)').should_not be_nil
    @driver.find_element(:css => '.poll > form:nth-of-type(1) > label:nth-of-type(1)').should_not be_nil
    @driver.find_element(:css => '.poll > form:nth-of-type(1) > label:nth-of-type(1)').should_not be_nil

    #Vote in poll
    @driver.find_element(:css => '.poll > form:nth-of-type(1) > label:nth-of-type(1) > input:nth-of-type(1)').click
    @driver.find_element(:css => '.poll > form:nth-of-type(1) > span:nth-of-type(1)').click
    @driver.find_element(:css => '.poll_results > li:nth-of-type(2) > div:nth-of-type(1)').should_not be_nil
    @driver.page_source.scan("Total votes: ").should_not be_nil
  end
end
