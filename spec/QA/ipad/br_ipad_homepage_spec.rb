# encoding: utf-8

require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The Homepage' do
  it 'Should Have Relevent Links' do
  url = '/'
  @driver.goto url

  #Get through the iPad App Roadblock
  begin
      @driver.find_element(:class, "no-thanks").click
  rescue Selenium::WebDriver::Error::ElementNotVisibleError , Selenium::WebDriver::Error::NoSuchElementError => e
      puts "Download App Link Not Shown"
  end

  @driver.title.should include("Bleacher Report")
  #################################
  #     header                    #
  #################################
  @driver.find_element(:id, 'logo').should_not be_nil

  ###############Articles#############
  @driver.find_element(:id, 'live-blog-front-page-module-wrapper').should_not be_nil
  @driver.find_element(:css, '.line-up-title').should_not be_nil
  @driver.find_element(:css, '.module.lineup').should_not be_nil

  #Get through the iPad App Roadblock
  #@driver.find_element(:class, "no-thanks").click

  ###############POLL##############
  @driver.find_element(:class, 'poll').should_not be_nil
  @driver.find_element(:css, '.module.poll_module').should_not be_nil
  @driver.find_element(:css, '.poll_results').should_not be_nil

  #################################
  #     content                   #
  #################################
  @driver.page_source.scan("NBA").should_not be_nil
  @driver.page_source.scan("MLB").should_not be_nil
  @driver.page_source.scan("NFL").should_not be_nil
  @driver.page_source.scan("Editor Picks").should_not be_nil
  @driver.page_source.scan("Can't-Miss Lists").should_not be_nil
  end
end
