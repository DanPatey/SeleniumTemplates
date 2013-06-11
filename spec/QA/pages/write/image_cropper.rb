class ImageCropper

  def initialize
    begin
      $long_wait.until { $driver.find_element(:id => "cropper-image_wrap") }
    rescue Exception => e
      raise "Image Cropper Was Not Loaded"
    end
    @caption_input = $wait.until { $driver.find_element(:id => "cropper-caption-input")}
    @add_photo_button = $driver.find_element(:id => "crop-button")
    @add_photo_button.location_once_scrolled_into_view
    @image_full_width_checkbox = $driver.find_element(:id => "image_full_width") 
    @close_button = $driver.find_element(:class => "close")
    @cropper_image = $wait.until { $driver.find_element(:name => "cropper-image") }
  end

  def set_caption(input)
    @caption_input.send_keys(input)
  end

  def toggle_full_width
    @image_full_width_checkbox.click
  end

  def submit_crop
    sleep 2
    @add_photo_button.location_once_scrolled_into_view
    @add_photo_button.click
    begin
      $wait.until { $driver.find_element(:id => "image-gallery-spinner") == nil }
    rescue Selenium::WebDriver::Error::TimeOutError, Selenium::WebDriver::Error::StaleElementReferenceError => e
      $long_wait.until { $driver.find_element(:class => "media_area_title") }
    end
  end
end