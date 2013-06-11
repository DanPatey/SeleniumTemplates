# encoding: utf-8

require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The Homepage' do
  it 'Should Have Relevent Links' do
  url = '/'
  @driver.goto url
  @driver.title.should include("Bleacher Report | Entertaining sports news, photos and slideshows")

  #################################
  #     header                    #
  #################################
  @driver.find_element(:id, 'logo').should_not be_nil
  @driver.find_element(:id, 'handle').should_not be_nil

  #################################
  #     content                   #
  #################################
  @driver.find_element(:id, 'lead-story').should_not be_nil

  @driver.page_source.scan("Olympics").should_not be_nil
  @driver.page_source.scan("NBA").should_not be_nil
  @driver.page_source.scan("MLB").should_not be_nil
  @driver.page_source.scan("NFL").should_not be_nil
  @driver.page_source.scan("Editor Picks").should_not be_nil
  @driver.page_source.scan("Can't-Miss Lists").should_not be_nil
  end
end
