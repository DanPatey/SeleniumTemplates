require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The Team Page Redesign' do
  it 'Should Have Sane Links' do
    url = '/toronto-blue-jays'
    @driver.goto url

    #Team stream:
    @driver.find_element(:id, 'team-stream-module').should_not be_nil
    @driver.find_element(:css => '#team-stream-module > ul:nth-of-type(1) > li:nth-of-type(3)').should_not be_nil
    @driver.find_element(:css => '#team-stream-module > ul:nth-of-type(1) > li:nth-of-type(6)').should_not be_nil
    @driver.page_source.scan("Blue Jays Newsletter").should_not be_nil
    @driver.page_source.scan("Around the MLB").should_not be_nil
    @driver.page_source.scan("MLB on Twitter").should_not be_nil
    @driver.page_source.scan("Contributing Writers").should_not be_nil
    @driver.page_source.scan("Columnists").should_not be_nil
  end
end
