require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The Bay Area Local Section' do
  it 'Should Have Sane Links' do
    url = '/bay-area-sports'
    @driver.goto url
    @driver.title.should include("Bleacher Report Local San Francisco Bay Area Edition")

    #################################
    #     content       #
    #################################
    @driver.find_element(:id, 'lead-story').should_not be_nil
    @driver.find_element(:id, 'most-popular-module').should_not be_nil #text.should include("Most Popular")
    @driver.find_element(:id, 'most-commented-module').should_not be_nil #text.should include("Most Commented")

    modules = @driver.find_elements(:class => "module")
    modules[1].find_element(:css => 'h3 > a').text.should == 'SAN FRANCISCO 49ERS'
    modules[2].find_element(:css => 'h3 > a').text.should == 'GOLDEN STATE WARRIORS'
    modules[3].find_element(:css => 'h3 > a').text.should == 'SAN FRANCISCO GIANTS'
    modules[4].find_element(:css => 'h3 > a').text.should == 'SAN JOSE SHARKS'
    modules[5].find_element(:css => 'h3 > a').text.should == 'OAKLAND RAIDERS'

    #################################
    #     sidebar       #
    #################################
    @driver.find_element(:id, 'featured-columnists').text.should include("FEATURED COLUMNISTS")

    #################################
    #     footer        #
    #################################
    @driver.find_element(:id, 'sitecopyright').should_not be_nil
  end
end
