require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The B/R Swagger Page' do
  it 'Should Have Sane Links' do
    url = '/br-swagger'
    @driver.goto url
    #################################
    #     contentheader   #
    #################################
    @driver.find_element(:link, 'B/R Swagger').should_not be_nil

    #################################
    #     content       #
    #################################
    @driver.find_element(:id, 'lead-story').should_not be_nil
    @driver.find_element(:class, 'thumbnail').should_not be_nil
    @driver.page_source.scan("In Case You Missed It...").should_not be_nil
    @driver.page_source.scan("Hall of Fame").should_not be_nil
    @driver.page_source.scan("The Hot 100's").should_not be_nil
    @driver.page_source.scan("Top Writers").should_not be_nil
    @driver.page_source.scan("Must See Videos").should_not be_nil
    @driver.page_source.scan("Featured Columnists").should_not be_nil
    @driver.page_source.scan("Most Commented").should_not be_nil
  end
end
