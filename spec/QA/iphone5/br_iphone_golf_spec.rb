# encoding: utf-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The Golf Page' do
  it 'Should Have All Relevent Links' do
  url = '/golf'
  @driver.goto url
  @driver.title.should include("Golf news, opinion, photos, and more | Bleacher Report")

  #################################
  #     content                   #
  #################################
  @driver.page_source.scan("Lists/Rankings").should_not be_nil
  @driver.page_source.scan("Breaking News").should_not be_nil
  @driver.page_source.scan("Opinion").should_not be_nil
  @driver.page_source.scan("Previews/Predictions").should_not be_nil
  end
end
