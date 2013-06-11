require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'The Philadelphia Local Section' do
  it 'Should Have Sane Links' do
    url = '/philadelphia-sports'
    @driver.goto url

    #################################
    #     pageTopCorner             #
    #################################
    @driver.find_element(:id, 'powered-by-light').should_not be_nil

    #################################
    #     content                   #
    #################################
    @driver.find_element(:id, 'lead-story').should_not be_nil
    @driver.find_element(:id, 'most-popular-module').text.should include("MOST POPULAR")
    @driver.find_element(:id, 'most-commented-module').text.should include("MOST COMMENTED")

    headers = @driver.find_elements(:css => ".module > h3 > a")
    header_text = ['PHILADELPHIA EAGLES', 'PHILADELPHIA 76ERS', 'PHILADELPHIA FLYERS']
    headers.each_with_index do |header, index|
       raise "A Title on This Page is Incorrect" unless header.text == header_text[num]
    end
    #################################
    #     sidebar                   #
    #################################
    @driver.find_element(:id, 'featured-columnists').text.should include("FEATURED COLUMNISTS")
    @driver.find_element(:id, 'sidebar').text.should include("TOP NATIONAL STORIES")
    @driver.find_element(:id, 'sidebar').text.should include("FEATURED SLIDESHOWS")

    #################################
    #     footer                    #
    #################################
    @driver.find_element(:link, 'About Philly.com').should_not be_nil
    @driver.find_element(:link, 'Contact Us').should_not be_nil
    @driver.find_element(:link, 'Terms of Use & Privacy Statement').should_not be_nil
    @driver.find_element(:link, 'Copyright').should_not be_nil
  end
end
