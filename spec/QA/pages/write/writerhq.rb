require File.join(File.dirname(__FILE__), 'topics')
class WriterHQ 

  def initialize
    # ~~ Hat Items Are Visible
    #@header_logo = $driver.find_element(:xpath => '//*[@id="hat-logo"]/a/img')
    #@page_header = $driver.find_element(:css => "#page-header h1 a").text
    
    # ~~ Wrte Article Buttons Are Visible 
    begin  
      @stand_article = $wait.until { $driver.find_element(:id => "new-article") }
      @slideshow = $wait.until { $driver.find_element(:id => "new-slideshow")}
      @live_blog = $wait.until { $driver.find_element(:id => "new-live-blog") }
      @quick_hits = $wait.until { $driver.find_element(:id => "new-quick-hits") }
      @video = $wait.until { $driver.find_element(:id => "new-video") }
      @debate = $wait.until { $driver.find_element(:id => "new-debate") }
    rescue Selenium::WebDriver::Error::NoSuchElementError,Selenium::WebDriver::Error::TimeOutError => e 
      puts "WARNING: An Article Type is Missing in HQ"
    end
  end

  def create_article(type)
    case type
      when "Standard Article" 
        @stand_article.click 
      when "Slideshow" 
        @slideshow.click
      when "Video Slideshow" 
        @video_slideshow.click
      when "Gallery Slideshow" 
        @gallery_slideshow.click
      when "Live Blog" 
        @live_blog.click
      when "Quick Hits" 
        @quick_hits.click
      when "Video" 
        @video.click
      when "Debate" 
        @debate.click
      else
        raise "Not A Supported Article Type"
    end
  end

  def select_article(name)
    article = $driver.find_element(:partial_link_text => "#{name}")
    $article_url = article.attribute('href')
    `open #{$article_url}`
    article.click
  end

  def edit_article(name)
    $driver.find_element(:partial_link_text => "#{name}").find_element(:xpath => '../../td[7]/a[1]').click
  end

  def delete_article(name)
    $driver.find_element(:partial_link_text => "#{name}").find_element(:xpath => '../../td[7]/a[2]').click
  end

  def set_topics
    t = Topics.new
    t.set_tag
    t.publish
  end

  def skip_topics
    Topics.new.skip_article_tags_and_publish
  end

  def publish
    Topics.publish
  end

  def verify_article_published
    begin
      while $driver.find_element(:xpath => '//*[@id="content"]/div[3]/div[2]/table/tbody/tr[2]/td[6]').text == "Pending" do
        sleep 5
        $driver.find_element(:class => "pencil").click
        $driver.find_element(:link, 'Write').click
      end
    rescue Selenium::WebDriver::Error::NoSuchElementError => e
      puts "Could not find Article trying again..."
      retry
    end
  end

  def select_published_article
    $driver.find_element(:xpath => '//*td[contains(.,"#{time}")').click
  end

end