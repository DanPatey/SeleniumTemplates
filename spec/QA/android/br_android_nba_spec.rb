# encoding: utf-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The NBA Page' do
  it 'Should Have All Relevent Links' do
  url = '/nba'
    @driver.goto url

  @driver.title.should include("NBA news, opinion, photos, and more | Bleacher Report")

  #################################
  #             content           #
  #################################
  @driver.find_element(:id, 'lead-story').should_not be_nil

  @driver.find_element(:css => '#lead-story-wrapper > div:nth-of-type(2) > ul:nth-of-type(1) > li:nth-of-type(1)').should_not be_nil
  @driver.find_element(:css => '#lead-story-wrapper > div:nth-of-type(2) > ul:nth-of-type(1) > li:nth-of-type(2)').should_not be_nil
  @driver.find_element(:css => '#lead-story-wrapper > div:nth-of-type(2) > ul:nth-of-type(1) > li:nth-of-type(3)').should_not be_nil
  @driver.find_element(:css => '#lead-story-wrapper > div:nth-of-type(2) > ul:nth-of-type(1) > li:nth-of-type(4)').should_not be_nil

  @driver.page_source.scan("Free Agency and Trades").should_not be_nil
  @driver.page_source.scan("Summer League").should_not be_nil
  @driver.page_source.scan("NBA Analysis").should_not be_nil
  @driver.page_source.scan("Rankings and Lists").should_not be_nil
  end
end
