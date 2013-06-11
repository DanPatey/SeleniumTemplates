require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The NFL Page' do
  it 'Should Have Sane Links' do
    url = '/nfl'
    @driver.goto url
    #################################
    #     contentheader   #
    ##################################
    @driver.find_element(:link, 'NFL').should_not be_nil
    #################################
    #             content           #
    #################################
    @driver.find_element(:id, 'lead-story').should_not be_nil
    @driver.find_element(:class, 'thumbnail').should_not be_nil
    @driver.find_element(:link, 'Newsletter').should_not be_nil
    @driver.page_source.scan("NFL Analysis").should_not be_nil
    @driver.page_source.scan("Fantasy Football").should_not be_nil
    @driver.page_source.scan("Rookie Watch").should_not be_nil
    @driver.page_source.scan("NFL Debate").should_not be_nil
    @driver.page_source.scan("Featured Columnists").should_not be_nil
    @driver.page_source.scan("Most Commented").should_not be_nil
    @driver.page_source.scan("Official B/R Partner").should_not be_nil
    @driver.page_source.scan("Top Writers").should_not be_nil
  end
end
