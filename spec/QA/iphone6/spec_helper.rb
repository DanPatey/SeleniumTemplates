require 'rspec'
require 'selenium-webdriver'

module SpecHelper
  class Driver
    attr_reader :driver

    BROWSERS = ['firefox', 'chrome', 'internet_explorer', 'opera']
    OSES     = ['XP', 'VISTA', 'LINUX']

    def initialize(title)
      @title = title
      @environment = ENV['ENVIRONMENT'] || 'gamma'

      @browser = ENV['BROWSER'] || 'chrome'
      raise "BROWSER must be one of #{BROWSERS.join(', ')}" unless BROWSERS.include?(@browser.to_s)
      @version = ENV['VERSION'] || '13'
      @os      = ENV['OS'] || :XP
      raise "OS must be one of #{OSES.join(', ')}" unless OSES.include?(@os.to_s)

      @driver = if ENV['TEST_ENV'] == 'local'
                  local_driver
                elsif ENV['TEST_ENV'] == 'iphone4'
                  iphone4_driver
                elsif ENV['TEST_ENV'] == 'iphone5'
                  iphone5_driver
                elsif ENV['TEST_ENV'] == 'iphone6'
                  iphone6_driver
                elsif ENV['TEST_ENV'] == 'ipad4'
                  ipad4_driver
                elsif ENV['TEST_ENV'] == 'ipad5'
                  ipad5_driver
                elsif ENV['TEST_ENV'] == 'ipad6'
                  ipad6_driver
                elsif ENV['TEST_ENV'] == 'android'
                  android_driver
                else
                  saucelabs_driver
                end
    end

    def local_driver
      Selenium::WebDriver.for(@browser.to_sym)
    end

    def iphone4_driver
      caps = Selenium::WebDriver::Remote::Capabilities.iphone
      caps.platform = 'Mac 10.6'
      caps.version = '4.3'

      Selenium::WebDriver.for(
        :remote,
        :url => 'http://#YOURSAUCEKEYHERE@ondemand.saucelabs.com:80/wd/hub',
        :desired_capabilities => caps)
    end

    def iphone5_driver
      caps = Selenium::WebDriver::Remote::Capabilities.iphone
      caps.platform = 'Mac 10.8'
      caps.version = '5.1'

      Selenium::WebDriver.for(
        :remote,
        :url => 'http://#YOURSAUCEKEYHERE@ondemand.saucelabs.com:80/wd/hub',
        :desired_capabilities => caps)
    end

    def iphone6_driver
      caps = Selenium::WebDriver::Remote::Capabilities.iphone
      caps.platform = 'Mac 10.8'
      caps.version = '6'

      Selenium::WebDriver.for(
        :remote,
        :url => 'http://#YOURSAUCEKEYHERE@ondemand.saucelabs.com:80/wd/hub',
        :desired_capabilities => caps)
    end

    def ipad4_driver
      caps = Selenium::WebDriver::Remote::Capabilities.ipad
      caps.platform = 'Mac 10.6'
      caps.version = '4.3'

      Selenium.WebDriver.for(
        :remote,
        :url => 'http://#YOURSAUCEKEYHERE@ondemand.saucelabs.com:80/wd/hub',
        :desired_capabilities => caps)
    end

    def ipad5_driver
      caps = Selenium::WebDriver::Remote::Capabilities.ipad
      caps.platform = 'Mac 10.8'
      caps.version = '5.1'

      Selenium.WebDriver.for(
        :remote,
        :url => 'http://#YOURSAUCEKEYHERE@ondemand.saucelabs.com:80/wd/hub',
        :desired_capabilities => caps)
    end

    def ipad6_driver
      caps = Selenium::WebDriver::Remote::Capabilities.ipad
      caps.platform = 'Mac 10.8'
      caps.version = '6'

      Selenium.WebDriver.for(
        :remote,
        :url => 'http://#YOURSAUCEKEYHERE@ondemand.saucelabs.com:80/wd/hub',
        :desired_capabilities => caps)
    end

    def android_driver
      caps = Selenium::WebDriver::Remote::Capabilities.android
      caps.platform = 'Linux'
      caps.version = '4'

      Selenium::WebDriver.for(
        :remote,
        :url => 'http://#YOURSAUCEKEYHERE@ondemand.saucelabs.com:80/wd/hub',
        :desired_capabilities => caps)
    end

    def saucelabs_driver
      caps = Selenium::WebDriver::Remote::Capabilities.send(@browser.to_sym)
      caps.version = @version unless @browser.to_s == 'chrome'
      caps.platform = @os
      caps[:name] = @title || 'BR Selenium Ruby and Sauce Test'

      Selenium::WebDriver.for(
        :remote,
        :url => 'http://#YOURSAUCEKEYHERE@ondemand.saucelabs.com:80/wd/hub',
        :desired_capabilities => caps)
    end

    def goto(url)
      if url.include?("?")
        url = "#{url}&ads=0&skins=0"
      else
        url = "#{url}?ads=0&skins=0"
      end
      if @environment == 'alpha'
        @driver.navigate.to "#YOURURLHERE"+url
      elsif @environment == 'beta'
        @driver.navigate.to "#YOURURLHERE"+url
      elsif @environment == 'gamma'
        @driver.navigate.to "#YOURURLHERE"+url
      elsif @environment == 'delta'
        @driver.navigate.to "#YOURURLHERE"+url
      else
        @driver.navigate.to "#YOURURLHERE"+url
      end
    end

    def hover(type, selector, options = {})
      # Get element to mouse over
      e = @driver.find_element(type, selector)
      # Use Javascript to mouseover
      @driver.execute_script("if(document.createEvent){var evObj = document.createEvent('MouseEvents');evObj.initEvent('mouseover', true, false); arguments[0].dispatchEvent(evObj);} else if(document.createEventObject) { arguments[0].fireEvent('onmouseover');}", e)
      # Do extra stuff given by the block
      yield e if block_given?
      begin
        # Mouse out using Javascript
        @driver.execute_script("if(document.createEvent){var evObj = document.createEvent('MouseEvents');evObj.initEvent('mouseout', true, false); arguments[0].dispatchEvent(evObj);} else if(document.createEventObject) { arguments[0].fireEvent('onmouseout');}", e)
      rescue
      end
    end

    def login(email, password)
      title = @driver.title

      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:id => "log_in_link") }

      @driver.find_element(:id, 'log_in_link').click
      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:id => "login_button") }

      element = @driver.find_element(:id, 'hat_log_in_email')
      element.send_keys(email)
      element = @driver.find_element(:id, 'hat_log_in_password')
      element.send_keys(password)
      element.submit
      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:css => "span.user-full-name") }
    end

    def logout
      @driver.find_element(:css, 'span.user-full-name').click
      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:link => "Logout") }

      @driver.find_element(:link, 'Logout').click
      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:id => "log_in_link") }
    end

    def login_facebook(email, password)
      title = @driver.title

      @driver.find_element(:id, 'email').send_keys(email)

      element = @driver.find_element(:id, 'pass')
      element.send_keys(password)
      element.submit
    end

    ### Adds a photo to an article / slideshow etc. that is in progress ###
    def add_media(tag)

      @driver.find_element(:link, 'Add Photo').click

      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:id => "image-search-button") }

      # Type 'tag' into search module
      @driver.find_element(:id, 'image-search-input').send_keys(tag)
      @driver.find_element(:id, 'image-search-button').click

      # wait for picture to show up, then click top left picture
      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:xpath => '//*[@id="gallery-image-list"]/li[1]/div[1]/img') }
      element =  @driver.find_element(:xpath => '//*[@id="gallery-image-list"]/li[1]/div[1]/img')
      wait.until {element.displayed?}
      element.click

      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until {@driver.find_element(:id, "cropper-image_wrap")}

      # Wait while image is laoded into cropper
      element = @driver.find_element(:id, "cropper-image_wrap")
      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until {element.displayed?}

      @driver.find_element(:id, 'cropper-caption-input').send_keys('asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfsadasdf')

      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until {(@driver.find_element(:id, 'crop-button')).displayed?}

      @driver.find_element(:id, 'crop-button').click

      # Wait while image is processed.
      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:link => "Edit Photo") }
    end

    ### Adds a video to an article / slideshow etc. that is in progress ###
    def add_video(tag)

      @driver.find_element(:link, 'Add Video').click

      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:link_text, "Save Video") }

      # Type in URL of video into
      @driver.find_element(:id, 'videoUrlField').send_keys(tag)
      @driver.find_element(:link_text, "Save Video").click

      # Wait while video is processed
      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:link_text, "Edit Video") }
    end

    ### Adds text to body of an article / slideshow etc. that is in progress ###
    def add_content_to_body

      f = File.open(File.join(File.dirname(__FILE__), 'WritingExample.txt'))
      s = f.gets

      b = @driver

      # Switch to frame of editor so that text can be inputed
      b.switch_to.frame "editor_ifr"
      b.switch_to.active_element.send_keys(s)
      driver.switch_to.default_content

      sleep 3

      #click spell check button and done with spell check button
      @driver.find_element(:id, 'spell_check_button').click
      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until {(@driver.find_element(:id, 'spell_check_button_done')).displayed?}
      @driver.find_element(:id, 'spell_check_button_done').click
    end

    ### Adds a tag to an article / slideshow etc. that is in progress ###
    def add_tag

      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:id, "tag-chooser") }

      # Input "Tiger Woods" into search module
      @driver.find_element(:id, "tag-chooser").send_keys("tiger woods")

      # Wait for Tiger Woods to appear in drop - down, then select it
      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:class, "tag-chooser-checkbox") }
      @driver.find_element(:link_text, "Tiger Woods").click

      # Select article type to be "Breaking News"
      @driver.find_element(:id, 'breaking_news_tag').click

      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:link_text, "Golf") }

      # Select league to be 'Golf'
      @driver.find_element(:link_text, 'Golf').click
    end

    def signup
      @driver.find_element(:id, 'sign_up_link').click

      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:id => "hat_signup_submit") }

      @driver.find_element(:name, 'first_name').send_keys(SpecHelper.time)
      @driver.find_element(:name, 'last_name').send_keys "Tester"
      @driver.find_element(:name, 'email').send_keys(SpecHelper.time + '@bleacherreport.com')
      @driver.find_element(:name, 'password').send_keys "br123"
      @driver.find_element(:name, 'password_confirmation').send_keys "br123"

      element = @driver.find_element(:id, 'hat_sign_up_captcha')
      element = element.text
      element.gsub!('What is ','')
      element.gsub!('? (required)','')
      element = element.split
      captcha = @driver.find_element(:id, 'br-hat-sign-up-captcha')

      if element[1] = '+'
        captcha.send_keys(element[0].to_i + element[2].to_i)
      elsif element[0] = 'George'
        captcha.send_keys(element[0])
      else
        captcha.send_keys(element[5])
      end

      captcha.submit

      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:id => "hat_finished_button") }

      element = @driver.find_element(:id, 'hat-tag-chooser-query')
      element.send_keys "Los Angeles Lakers"
      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:css => 'li[tag_id="203"]') }

      @driver.find_element(:css, 'li[tag_id="203"]').click

      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:css => 'li[tag_id="203"]') }

      @driver.find_element(:id, 'hat-tag-chooser-query').send_keys "SEC Football"

      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:css => 'li[tag_id="74"]') }

      @driver.find_element(:css, 'li[tag_id="74"]').click
      @driver.find_element(:id, 'hat_finished_button').click

      wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
      wait.until { @driver.find_element(:css => "span.user-full-name") }
    end

    def method_missing(method, *args, &block)
      @driver.send(method, *args, &block)
    end
  end

  def find_element(*params)
    @driver.find_element(*params)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError => e
    false
  end

  def self.time
    Time.now.to_i.to_s
  end

  def poll
    element = @driver.find_element(:css, 'div.poll')
  end
end

RSpec.configure do |config|
  config.around(:each) do |example|
    @driver = SpecHelper::Driver.new((example.metadata[:example_group][:description_args] + example.metadata[:description_args]).join(' '))
    run_status = example.run
    success = !(run_status.is_a?(RSpec::Expectations::ExpectationNotMetError) || run_status.class.to_s =~ /Error/)
    bridge = @driver.driver.instance_variable_get(:@bridge)

    unless bridge.http.instance_variable_get(:@server_url).to_s.inspect =~ /127\.0\.0\.1/
      session_id = bridge.session_id
      command = %[curl -H "Content-Type:text/json" -s -X PUT -d '{"passed": #{success}}' http://cloudbees_bleacher:b3af4895-9684-4c75-8211-246d26fb7183@saucelabs.com/rest/v1/cloudbees_bleacher/jobs/#{session_id}]
      `#{command}`
    end
    @driver.quit
  end
end
