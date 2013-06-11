require 'selenium-webdriver'
require File.join(File.dirname(__FILE__), '../libs/store_to_mongo')
require File.join(File.dirname(__FILE__), '../libs/test_helper')

class Writer < TestHelper
  def initialize(version, search_term, name)
    $version = version
    $search_term = search_term
    $time = SpecHelper.time
    $name =  $time + " " + name
    
    case version
    when "legacy"
      user = "dan"
    when "discovery"
      user = "felix"
    else
      raise "Version Unsupported, Either 'legacy' or 'discovery'"
    end
    
    $th = TestHelper.new
    $th.login(user)
    puts "\n" + $hr
    puts name
    puts $hr
    $driver.find_element(:xpath => '//*[@id="user-menu"]/li[6]/span[2]').click 
    $driver.find_element(:xpath =>'//*[@id="user-menu"]/li[6]/ul/li[1]/a').click
    #$branch_name = $wait.until { $driver.find_element(:id => "branch-name").text.slice(9) } || "prod"
    #$driver.find_element(:xpath => '//*[@id="branch-name"]/span').click unless ENV['ENVIRONMENT'] == "prod"
  end

  def get_stats(type) 
    s = StoreToMongo.new
    puts s.calculate_stats("#{type}_search") unless type == "tweet" || type == "poll"
    puts s.calculate_stats("drag_and_drop_#{type}")
    puts s.calculate_stats("move_#{type}")
  end

end
