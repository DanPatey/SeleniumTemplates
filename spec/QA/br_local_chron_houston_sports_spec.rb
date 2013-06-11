require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The Houston Local Section' do
  it 'Should Have Sane Links' do
    url = '/houston-sports'
    @driver.goto url

    #contentheader

    begin
        @driver.find_element(:link_text, 'Powered by Bleacher Report')
    rescue Selenium::WebDriver::Error::NoSuchElementError => e
        raise "No Powered By B/R Link" 
    end

    #content
    @driver.find_element(:id, 'lead-story').should_not be_nil

    #other modules
    @driver.find_element(:id, 'most-popular-module').text.should include("MOST POPULAR")
    @driver.find_element(:id, 'most-commented-module').text.should include("MOST COMMENTED")

    modules = @driver.find_elements(:class => "module")
    modules[1].find_element(:css => 'h3 > a').text.should == 'HOUSTON TEXANS'
    modules[2].find_element(:css => 'h3 > a').text.should == 'HOUSTON ROCKETS'
    modules[3].find_element(:css => 'h3 > a').text.should == 'TEXAS LONGHORNS FOOTBALL'
    modules[4].find_element(:css => 'h3 > a').text.should == 'TEXAS A&M FOOTBALL'

    #sidebar
    @driver.find_element(:id, 'featured-columnists').text.should include("FEATURED COLUMNISTS")
    @driver.find_element(:id, 'sidebar').text.should include("TOP NATIONAL STORIES")
    @driver.find_element(:id, 'sidebar').text.should include("FEATURED SLIDESHOWS")
  end
end
