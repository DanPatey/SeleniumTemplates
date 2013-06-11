require File.join(File.dirname(__FILE__), 'media')
require File.join(File.dirname(__FILE__), 'supported_videos')
require 'cgi'

class Videos 
  def search
    s = Time.now.to_i
    Media.search
    verify_search_results
    $th.end_timer(s,"video_search")
  end

  def embed(url,paragraph, title,expand=false,custom=false,bleacher=false)
    embed_button = $wait.until { $driver.find_elements(:class => 'embed')[1] }
    embed_button.click
    title_input = $driver.find_elements(:xpath => '//*[@id="custom-content"]/div[2]/p[2]/input')[1]
    embedd_input = $driver.find_elements(:class => 'embed-code-text-area')[3]
    submit = $driver.find_elements(:xpath => '//*[@id="custom-content"]/div[2]/a[2]')[1]
    begin
      custom_checkbox = $driver.find_element(:id => 'videoCustomCheckbox')
      bleacher_checkbox = $driver.find_element(:id => 'bleacherVideoCheckbox')
    rescue Selenium::WebDriver::Error::NoSuchElementError => e
      puts "* A Video Embed Option is Missing"
    end
    #Embedd Video
    title_input.send_keys(title)
    embedd_input.send_keys(url)
    custom_checkbox.click if custom
    bleacher_checkbox.click if bleacher
    submit.click
    Media.drag_and_drop(verify_video_embedded(title), paragraph)
    verify_video_added(paragraph)
    sleep 5
    Media.resize(paragraph,"expand") if expand
  end

  def insert(paragraph, caption=nil)
    s = Time.now.to_i
    verify_search_results
    Media.drag_and_drop(@video_description,paragraph)
    verify_video_added(paragraph)
    #verify_caption(paragraph,caption) unless caption == nil
    $th.end_timer(s,"insert_video")
  end

  def edit(source,embed_code,caption,full_width=0,custom=0,bleacher_video=0,start_time=0)
    # ~~ Get All Edit Video Elements
    edits_in_article = $wait.until { $driver.find_elements(:class => "add-video") }
    edits_in_article[source].click
    video_embed_code = $wait.until { $driver.find_element(:id => "videoUrlField") }
    video_caption_field = $wait.until { $driver.find_element(:id => "videoCaptionField") }
    begin
      full_width_toggle = $driver.find_element(:id => "video_full_width")
      custom_toggle = $driver.find_element(:id => "videoCustomCheckbox")
      bleacher_video_toggle = $driver.find_element(:id => "bleacherVideoCheckbox")
    rescue Selenium::WebDriver::Error::NoSuchElementError => e
      puts "* Edit Options Missing"
    end
    save_video = $driver.find_element(:id => "videoEmbedButton")
    # ~~ Interact With Panel
    check_video_start_time(video_embed_code,start_time) unless start_time == 0
    video_embed_code.send_keys(embed_code)
    video_caption_field.send_keys(caption)
    full_width_toggle.click unless full_width == 0
    #custom_toggle.click unless custom == 0
    #bleacher_video_toggle.click unless bleacher_video == 0
    save_video.click
    verify_video_added(source)
    sleep 2
    #$driver.find_elements(:css => "span.caption")[index+1].text.should == caption
    #$driver.switch_to.frame($driver.find_element(:class => "video_embed"))
  end
    def check_video_start_time(element,time)
      code = element.text
      time = code.slice(30)
    end
  
  def move(source,target)
    s = Time.now.to_i
    Media.move(source,target)
    verify_video_added(target)
    $th.end_timer(s,"move_video")
  end

  def delete(num)
    s = Time.now.to_i
    Media.delete(num)
    $th.end_timer(s,"delete_video")
  end

  def verify_search_results
    $wait.until { $driver.find_element(:id => "discovery-search-youtube-list").location_once_scrolled_into_view }
    $wait.until { $driver.find_element(:xpath => '//*[@id="discovery-search-youtube-list"]/div[1]').displayed? }
    @youtube_result = $wait.until { $driver.find_element(:xpath => '//*[@id="discovery-search-youtube-list"]/div[1]')}
    @youtube_videos = $wait.until { $driver.find_elements(:class => "new_draggable_media") }
    #$wait.until { $driver.find_element(:xpath => '//*[@id="discovery-search-youtube-list"]/div[1]/div').should_not be_nil }
    #@youtube_id = $wait.until { $driver.find_element(:xpath => '//*[@id="discovery-search-youtube-list"]/div[1]/div').attribute("data-youtube_id") }
    #@long_wait.until { $driver.find_element(:class => "thumbnail").should_not be_nil }
    @video_play_button = $wait.until { $driver.find_element(:class => "video-play-button") }
    $driver.find_element(:class => "video-progress-bar").should_not == nil
    $driver.find_element(:class => "video-player").should_not == nil
    #$driver.find_element(:id => "^player-$" + @youtube_id)
    @youtube_video = @youtube_videos[1]
    @video_description = $driver.find_element(:xpath => '//*[@id="discovery-search-youtube-list"]/div[2]/div/div[2]/p')
  end

  def verify_video_added(paragraph)
    drop_points = $wait.until { $driver.find_elements(:class => 'ui-droppable') }
    video = $wait.until { drop_points[paragraph].find_elements(:xpath => '//div[contains(@id,"media-area-")]')}
  end

  def verify_play_button_loads_video
    @video_play_button.click
    sleep 5
    $wait.until { $driver.find_element(:xpath => '//iframe[contains(@id,"player-")]')}
    $driver.switch_to.default_content
    $driver.find_element(:class => "thumbnail").click
  end

  def set_video_start_time(time)
    input = $wait.until { $driver.find_element(:name => "start_time") }
    checkbox = $wait.until { $driver.find_element(:name => "apply_start_time") }
    input.clear
    input.send_keys(time)
    input.send_keys(:enter)
    checkbox.click
  end

  def filter_youtube_results(filter)
    # "relevance" || "date" || "viewcount" || "rating"
    $driver.find_element(:class => "youtube-filter").find_element(:css => "option[value='#{filter}']").should_not == nil
    dropdown = $driver.find_element(:class => "youtube-filter").find_element(:css => "option[value='#{filter}']")
    dropdown.click
  end
  def verify_video_embedded(name)
    title = $wait.until { $driver.find_element(:css => 'div#discovery-video-embed > div:last-of-type > div:nth-of-type(2) > h4') }
    title.text.should == name
    video = $driver.find_element(:css => 'div#discovery-video-embed > div:last-of-type > div:nth-of-type(1) > img')
  end

  def validate_embed_codes(key_name=nil)
    if $supported_videos_for_embedding.has_key?(key_name)
      key_values = $supported_videos_for_embedding[key_name]
      puts "-" * 20
      puts "- Embedding a #{key_name} video"
      key_values.each do |site|
        puts "-- URL: #{site.to_s}"
        embed(site.to_s,1, "Test Embed")
        sleep 5
        embed(site.to_s,2, "Test Embed",true)
        sleep 5
      end
    else
      $supported_videos_for_embedding.each do |site, urls|
        puts "-" * 20
        puts "- Embedding a #{site} video"
        urls.each do |url|
          puts "-- URL: #{url.to_s}"
          embed(url.to_s,1, "Test Embed")
          sleep 5
        end
      end
    end
  end
end