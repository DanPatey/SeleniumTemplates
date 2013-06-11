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
  #@driver.find_element(:id, 'header').should_not be_nil
  @driver.find_element(:id, 'logo').should_not be_nil
  @driver.find_element(:title, 'Home').should_not be_nil

  #Get through the iPad App Roadblock
  #@driver.find_element(:class, "no-thanks").click

  #################################
  #     content                   #
  #################################
  @driver.find_element(:id, 'live-blog-front-page-module-wrapper').should_not be_nil
  @driver.find_element(:id, 'live-blog-front-page-module').should_not be_nil
  @driver.find_element(:css, '.br-ad-wrapper').should_not be_nil

  #####LINEUP######
  @driver.find_element(:css, '.module.lineup').should_not be_nil
  @driver.find_element(:css, '.line-up-title').should_not be_nil
  @driver.find_element(:class, 'line-up-content').should_not be_nil
  #@driver.find_text_in_element(:css => '.module.lineup > div:nth-of-type(2) > ul:nth-of-type(1) > li:nth-of-type(3) > div:nth-of-type(2) > a:nth-of-type(1)').should_not be_nil
  @driver.find_element(:css => '.module.lineup > div:nth-of-type(2) > ul:nth-of-type(1) > li:nth-of-type(3) > div:nth-of-type(2) > a:nth-of-type(1)').should_not be_nil

  ######TEAM STREAM############
  @driver.find_element(:css, '.module.uber-stream').should_not be_nil
  @driver.find_element(:css => '#team-stream > div:nth-of-type(1) > div:nth-of-type(1) > h3').should_not be_nil
  #@driver.find_element(:css => '#team-stream-carousel > ul:nth-of-type(1) > li:nth-of-typ(2) > a:nth-of-type(1) > img').should_not be_nil

  @driver.find_element(:id, 'cycleNext').should_not be_nil
  #@driver.find_element(:id, 'cyclePrevious').should_not be_nil

  ###########CANT MISS LIST#############
  @driver.find_element(:id, 'cool-lists_module').should_not be_nil
  @driver.find_element(:css => '.module.wide-module > a').should_not be_nil
  @driver.find_element(:css => '.module.wide-module > a:nth-of-type(2)').should_not be_nil

  #############FEATURED COLUMNISTS###########################
  @driver.find_element(:id, 'wide-featured-columnists').should_not be_nil
  @driver.find_element(:css => '#wide-featured-columnists > ul:nth-of-type(1) > li:nth-of-type(4) > img').should_not be_nil
  @driver.find_element(:css => '#wide-featured-columnists > ul:nth-of-type(1) > li:nth-of-type(3) > a').should_not be_nil

  #@driver.find_element(:css => '#content > div:nth-of-type(4) > a:nth-of-type(2)').should_not be_nil
  #@driver.find_element(:css => '#content > div:nth-of-type(3) > div:nth-of-type(3)').should_not be_nil
  @driver.find_element(:id, 'wide-featured-columnists').should_not be_nil
  @driver.page_source.scan("NBA").should_not be_nil
  @driver.page_source.scan("MLB").should_not be_nil
  @driver.page_source.scan("NFL").should_not be_nil
  @driver.page_source.scan("Editor Picks").should_not be_nil
  @driver.page_source.scan("Can't-Miss Lists").should_not be_nil

  #@driver.find_element(:id,'copyright').text.should include("Copyright \302\251 2012 Bleacher Report, Inc. Turner Broadcasting System, Inc. All Rights Reserved. BleacherReport.com is part of Turner Sports Digital, part of the Turner Sports & Entertainment Digital Network.")
  #@driver.find_element(:css => '#footer > p:nth-of-type(3)').text.should include("Copyright \302\251 2012 Bleacher Report, Inc. Turner Broadcasting System, Inc. All Rights Reserved. BleacherReport.com is part of Turner Sports Digital, part of the Turner Sports & Entertainment Digital Network.")
  end
end
