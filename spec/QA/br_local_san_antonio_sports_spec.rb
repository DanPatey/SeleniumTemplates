require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The San Antonio Local Section' do
  it 'Should Have Sane Links' do
    url = '/san-antonio-sports'
    @driver.goto url

    #################################
    #     content       #
    #################################
    @driver.find_element(:id, 'lead-story').should_not be_nil
    @driver.find_element(:id, 'most-popular-module').text.should include("MOST POPULAR")
    @driver.find_element(:id, 'most-commented-module').text.should include("MOST COMMENTED")

    modules = @driver.find_elements(:class => "module")
    modules[1].find_element(:css => 'h3 > a').text.should == 'SAN ANTONIO SPURS'
    modules[2].find_element(:css => 'h3 > a').text.should == 'TEXAS LONGHORNS FOOTBALL'


    #################################
    #     sidebar       #
    #################################
    @driver.find_element(:id, 'featured-columnists').text.should include("FEATURED COLUMNISTS")
    @driver.find_element(:id, 'sidebar').text.should include("TOP NATIONAL STORIES")
    @driver.find_element(:id, 'sidebar').text.should include("FEATURED SLIDESHOWS")
  end
end
