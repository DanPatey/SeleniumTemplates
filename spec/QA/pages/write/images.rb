require File.join(File.dirname(__FILE__), 'media')
class Images

  def search
    s = Time.now.to_i
    Media.search
    verify_search_results
    $th.end_timer(s,"image_search")
  end

  def add_primary_photo(caption="Primary Photo")
    case $version
    when "legacy"
      el = $driver.find_elements(:class => "add-photo")[0]
      $driver.action.move_to(el,10,10).click.perform
    when "discovery"
      search
      insert(0,caption)
      get_primary_image_url 
    end
  end

  def get_primary_image_url
    img_url = $driver.find_element(:class => 'has_primary_photo').attribute('style')
    $img_url = img_url.match(/([0-9]+)_crop/)[1]
  end
  
  def upload_image
    @upload = $wait.until { $driver.find_element(:xpath => '//*[@id="discovery-upload-button"]/div/div/input') }
    s = Time.now.to_i
    $driver.file_detector = lambda do |args|
      str = args.first.to_s
      str if File.exist?(str)
    end
    @upload.click
    @upload.send_keys("../assets/test_image.jpg")
    $th.end_timer(s,"upload_image")
  end
  
  def insert(paragraph,caption=nil,full_width=false)
    s = Time.now.to_i
    source = verify_search_results
    target =  $wait.until { $driver.find_elements(:class => 'ui-droppable')[paragraph] }
    $driver.action.drag_and_drop(source, target).perform 
    cropper = ImageCropper.new
    cropper.set_caption(caption) unless caption == nil
    cropper.toggle_full_width unless full_width == false
    cropper.submit_crop
    verify_done_inserting(paragraph)
    verify_caption(paragraph,caption) unless caption == nil
    $th.end_timer(s,"insert_image")
  end

  def move(source, target)
    s = Time.now.to_i
    Media.move(source,target)
    verify_done_inserting(target)
    $th.end_timer(s,"move_image")
  end

  def edit(number,paragraph, caption=nil,full_width=false)
    # = Time.now.to_i
    $driver.find_elements(:class => 'edit-photo')[number].click
    cropper = ImageCropper.new
    cropper.set_caption(caption) unless caption == nil
    cropper.toggle_full_width unless full_width == false
    cropper.submit_crop
    verify_done_inserting(paragraph)
    verify_caption(paragraph,caption) unless caption == nil
    #$th.end_timer(s,"edit_image")
  end

  def delete(number)
    s = Time.now.to_i
    Media.delete(number)
    $th.end_timer(s,"delete_image")
  end
  
  def verify_search_results
    $wait.until { @image_source_getty = $driver.find_element(:xpath => '//*[@id="discovery-search-results-getty"]/div/span').text }
    $wait.until {@image_source_press = $driver.find_element(:xpath => '//*[@id="discovery-search-results-presswire"]/div/span').text }
    result = $long_wait.until { $driver.find_element(:xpath => '//*[@id="discovery-search-results-getty"]/ul/li[1]/div/img')}
  end

  def verify_done_inserting(index)
    $long_wait.until { $driver.find_element(:class => "media_area_title") }
  end

  def verify_caption(index,caption)
    captions = $wait.until { $driver.find_elements(:css => "span.caption") }
    $wait.until { captions[index-1].location_once_scrolled_into_view }
    captions[index-1].text.include? caption

    # CHECK FOR IMAGE ATTRIBUTION
    #$driver.find_element(:id => 'value')
  end

  def get_arrows
    begin
      @next_arrow = $driver.find_element(:class => "next") 
      @prev_arrow = $driver.find_element(:class => "previous") 
    rescue Selenium::WebDriver::Error::NoSuchElementError,Selenium::WebDriver::Error::TimeOutError => e
      puts "only one arrow is visible" + e
    end
  end

  def assert_slider_functionality
    get_arrows
    @next_arrow.location_once_scrolled_into_view
    @next_arrow.click
    verify_search_results
    get_arrows
    @next_arrow.displayed?.should == true #should be false but there is an extra column for now
    @prev_arrow.click
    @prev_arrow.displayed?.should == false
  end

  def check_sources
    $driver.find_elements(:class => '')
  end

  def verify_image_attribution
  end

end