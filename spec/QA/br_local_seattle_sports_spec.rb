require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'Seattle Local Section' do
  it 'Should Have Sane Links' do
    url = '/seattle-sports'
    @driver.goto url

    #################################
    #     contentheader   #
    #################################
    @driver.find_element(:id, 'powered-by').should_not be_nil

    #################################
    #     content       #
    #################################
    modules = @driver.find_elements(:class => "module")
    modules[1].find_element(:css => 'h3 > a').text.should == 'SEATTLE SEAHAWKS'
    modules[2].find_element(:css => 'h3 > a').text.should == 'SEATTLE MARINERS'
    modules[3].find_element(:css => 'h3 > a').text.should == 'SEATTLE SOUNDERS FC'
    modules[4].find_element(:css => 'h3 > a').text.should == 'WASHINGTON HUSKIES FOOTBALL'
    modules[5].find_element(:css => 'h3 > a').text.should == 'PORTLAND TRAIL BLAZERS'

    @driver.find_element(:id, 'most-popular-module').text.should include("MOST POPULAR")
    @driver.find_element(:id, 'most-commented-module').text.should include("MOST COMMENTED")

    #################################
    #     sidebar       #
    #################################
    @driver.find_element(:id, 'featured-columnists').text.should include("FEATURED COLUMNISTS")
    @driver.find_element(:id, 'sidebar').text.should include("TOP NATIONAL STORIES")
    @driver.find_element(:id, 'sidebar').text.should include("FEATURED SLIDESHOWS")
  end
end
