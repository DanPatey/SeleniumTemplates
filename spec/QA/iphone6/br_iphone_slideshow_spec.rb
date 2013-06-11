# encoding: UTF-8
require File.join(File.dirname(__FILE__), 'spec_helper')
require 'selenium-webdriver'

describe "Slideshows" do
  it "should be able to be read on mobile devices" do
    url = "/articles/1521247-biggest-signs-that-dwight-howard-will-remain-with-la-lakers-long-term"
    @driver.goto url
    @driver.title.should include("Bleacher Report")

    @wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    
    #################################
    #     content       #
    #################################
    @driver.find_element(:class, 'border-box').should_not be_nil
    @driver.find_element(:class, 'article-title').should_not be_nil
    container = @driver.find_element(:id, 'article-container')
    container.should_not be_nil
    @driver.find_element(:class, 'article-body').should_not be_nil

    # ~ Comment icon loads text field and closes:
    # comments-count comments-count-bottom js-open-comments
    #@driver.find_element(:xpath, '//*[@id="article-container"]/section[1]/div/span').click
    #@driver.find_element(:class, 'comments-textarea').should_not be_nil
    #@driver.find_element(:class, 'close-comments').click
    #@driver.find_element(:xpath, '//*[@id="article-container"]/section[1]/div/span').should_not be_nil

    # ~~ Click Comment Button
    sleep 20
    comment_button = @wait.until { @driver.find_elements(:xpath => '//*[@id="article-container"]/section[1]/div/div[2]/div[1]') }
    comment_button[0].click()
    #@driver.execute_script("arguments[0].click();", comment_button)
    #@driver.action.move_to(comment_button[0],20,20).click.perform

    # ~~ Check Comment Box Came Up and Close
    #ßcomment_box = @wait.until { @driver.find_element(:class => "comment-textarea") }
    
    # ~~ Swipe to next article
    article = @driver.find_element(:xpath => '//*[@id="article-container"]/section[2]/div/div[3]')
    @driver.action.drag_and_drop_by(article, -200, 0).perform
    sleep(10)

    # ~~ Check Slide Number
    slide_indicator = @driver.find_element(:xpath => '//*[@id="article-container"]/section[2]/div/header/hgroup/h3/span')
    slide_indicator.text.should == "(Slide 2 of 7)"
        

    #################################
    #     Legacy Code:       #
    #################################
    #Content
#    @driver.find_element(:id, "article-header").should_not be_nil
#    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(1) > img:nth-of-type(1)')
#    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(2)').should_not be_nil
#    @driver.page_source.scan("related_content").should_not be_nil
#    @driver.page_source.scan("comments").should_not be_nil

    #Comments box
#    @driver.find_element(:class, 'comments-count comments-count-top js-open-comments').click

    #Begin slideshow
#    @driver.find_element(:css => '#slide-header > div:nth-of-type(1) > div:nth-of-type(2)').click
#    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(1) > img:nth-of-type(1)').should_not be_nil
#    @driver.find_element(:css => '#article-container > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(2)').should_not be_nil

    #Next slide
#    @driver.find_element(:css=> '#slide-header > div:nth-of-type(1) > div:nth-of-type(2)').click
  end
end
