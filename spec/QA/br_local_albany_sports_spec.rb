require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The Albany Local Section' do
  it 'Should Have Sane Links' do
    url = '/albany-sports'
    @driver.goto url

    #################################
    #     contentheader   #
    #################################
    @driver.find_element(:id, 'powered-by').should_not be_nil
    @driver.find_element(:id, 'bleacher-albany-header').text.should include("Bleacher Report: Albany Edition")

    #################################
    #     content       #
    #################################
    wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    wait.until { @driver.find_element(:id, "lead-story") }

    element = @driver.find_element(:id, 'lead-story')
    element.should_not be_nil

    @driver.find_element(:id, 'most-popular-module').text.should include("MOST POPULAR")
    @driver.find_element(:id, 'most-commented-module').text.should include("MOST COMMENTED")

    headers = @driver.find_elements(:css => ".module > h3 > a")
    header_text = ['NEW YORK YANKEES','NEW YORK METS','NEW YORK GIANTS','NEW YORK KNICKS','NEW YORK JETS', 'NEW YORK RANGERS']
    headers.each_with_index do |header, index|
       raise "A Title on This Page is Incorrect" unless header.text == header_text[num]
    end

    #################################
    #     sidebar       #
    #################################
    @driver.find_element(:id, 'featured-columnists').text.should include("FEATURED COLUMNISTS")
    @driver.find_element(:id, 'sidebar').text.should include("TOP NATIONAL STORIES")
    @driver.find_element(:id, 'sidebar').text.should include("FEATURED SLIDESHOWS")
  end
end
