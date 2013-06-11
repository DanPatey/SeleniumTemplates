require File.join(File.dirname(__FILE__), 'store_to_mongo')
require 'selenium-webdriver'

class TestHelper
  def initialize
    $title = $driver.title
    @login = $wait.until { $driver.find_element(:id => "log_in_link")}
    $hr = '#' * 78
  end

  def login(user)
    case user
    when "dan"
      email="dpatey@bleacherreport.com"
      password="burton168!^*"

    when "felix"
      email="frodriguez@bleacherreport.com"
      password="k1zkazkontrol"
    else
      raise "User not configured to login"
    end
    @login.click
    login_button = $long_wait.until { $driver.find_element(:id => "login_button") }
    email_input = $wait.until { $driver.find_element(:id, 'hat_log_in_email') }
=begin
    a = driver.switch_to.alert
    if a.text == '"Google Chrome" would like to access your contacts'
      a.dismiss
    else
      a.accept
    end
=end
    password_input = $driver.find_element(:id, 'hat_log_in_password')
    email_input.send_keys(email)
    sleep(2)
    password_input.send_keys(password)
    
    password_input.submit
    $wait.until { $driver.find_element(:css => "span.user-full-name") }
  end

  def logout
    $driver.find_element(:css, 'span.user-full-name').click
    $wait.until { $driver.find_element(:link => "Logout") }
    $driver.find_element(:link, 'Logout').click
    $wait.until { $driver.find_element(:id => "log_in_link") }
  end

  def end_timer(start,type,search=nil)
    finish = Time.now.to_i
    time_elapsed = (finish - start) * 1000
    StoreToMongo.new.store_timing(time_elapsed,type, search)
  end

end