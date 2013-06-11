require File.join(File.dirname(__FILE__), 'image_cropper')
require File.join(File.dirname(__FILE__), 'article')
require File.join(File.dirname(__FILE__), 'images')
require File.join(File.dirname(__FILE__), 'videos')
require File.join(File.dirname(__FILE__), 'tweets')
require File.join(File.dirname(__FILE__), 'polls')

class Media 

  def initialize
    case $version
    when "legacy"
      
      $driver.find_element(:class => "previous").attribute("style").should == "display: none;"
      $driver.find_element(:css => "h3.active").text.should == "ADD MEDIA"
    else
      raise "Incorrect Version Supplied"
    end
  end

  def Media.image
    icon = $driver.find_element(:xpath => '//*[@id="media-nav"]/li[1]/img')
    icon.click
    Images.new
  end

  def Media.tweets
    icon = $wait.until { $driver.find_element(:xpath => '//*[@id="media-nav"]/li[2]') }
    icon.location_once_scrolled_into_view
    icon.click
    Tweets.new
  end

  def Media.video
    icon = $wait.until { $driver.find_element(:xpath => '//*[@id="media-nav"]/li[3]') }
    icon.location_once_scrolled_into_view
    icon.click
    Videos.new
  end

  def Media.polls
    polls = $wait.until { $driver.find_element(:xpath => '//*[@id="discovery-wrapper"]/div[1]/h3[2]') }
    polls.location_once_scrolled_into_view
    polls.click
    $driver.find_element(:css => "h3.active").text.should == "ADD POLLS"
    Polls.new
  end

  def Media.move(source, target)
    drop_points = $wait.until { $driver.find_elements(:class => 'ui-droppable') }
    source =  drop_points[source]
    target =  drop_points[target]
    $driver.action.drag_and_drop(source, target).perform
  end

  def Media.drag_and_drop(source,target)
    drop_points = $wait.until { $driver.find_elements(:class => 'ui-droppable') }
    target =  drop_points[target]
    $driver.action.drag_and_drop(source, target).perform
  end
  def Media.search
    search_input = $driver.find_element(:id => "discovery-search-field")
    search_input.send_keys($search_term)
    search_input.send_keys :enter
  end
  def Media.drag_and_drop(source, target)
    drop_points = $wait.until { $driver.find_elements(:class => 'ui-droppable') }
    target =  drop_points[target]
    $driver.action.drag_and_drop(source, target).perform
  end
  
  def Media.delete(number)
    number-=1
    trash = $wait.until { $driver.find_elements(:css => "a.trash")[number] }
    trash.location_once_scrolled_into_view
    trash.click
    msg = "Are you sure you want to delete?"
    $wait.until { $driver.find_element(:class => "sub-header").text.should == msg }
    confirm_delete = $driver.find_element(:class => "trash-button")
    confirm_delete.click
  end

  def Media.resize(media_slot,option)
    raise "Invalid Option" unless option == "expand" || option == "contract"
    button = $wait.until { $driver.find_elements(:class => option )[media_slot] }
    button.click    
  end

  def Media.next_arrow
    next_arrow = $wait.until { $driver.find_element(:class => "next") }
    next_arrow.click
  end

  def Media.done
    ArticleNavigation.next_step
  end
end
#################################
#       LEGACY CMS              #
#################################
class Legacy

  def initialize
    @add_media = $driver.find_element(:xpath => '//*[@id="add_media"]/div[1]/h3').text.should == "ADD MEDIA"
    @media_slot = $driver.find_element(:xpath => '//*[@id="add_media"]/div[2]/div')
    @drop_points = $driver.find_elements(:class => 'ui-droppable')
  end

  def add_media_slot(paragraph, video=false)
    $driver.action.drag_and_drop(@media_slot, @drop_points[paragraph]).perform 
    $wait.until { $driver.find_elements(:class => "draggable_media") }
  end

  def add_content(type,paragraph=0)
    sleep 10
    buttons = $wait.until { $driver.find_elements(:class => "small-orange") }
    media_options = $wait.until { $driver.find_elements(:xpath => '//*[@class="media_area_controls"]/a') } unless type == "primary photo"
    case type
    when "primary photo"
      el = $wait.until { $driver.find_elements(:class => "add-photo")[0] }
      $wait.until { el.displayed? }
      $driver.action.move_to(el,10,10).click.perform
      self.getty_search
    when "delete"
      media_options[0].click
    when "add photo"
      media_options[1].click
    when "add poll"
      buttons[3].click
    when "add video"
      buttons[4].click
    when "tweet"
      buttons[5].click
    when "podcast" 
      buttons[6].click
    else 
      raise "Media Type Unavailable"
    end
  end

  def Legacy.getty_search
    # GET ELEMENTS
    input = $wait.until { $driver.find_element(:class => "image-search-input") }
    getty = $wait.until { $driver.find_element(:id => "image-search-button") }
    # SEARCH FOR IMAGE
    input.send_keys($search_term)
    getty.click
    # GET IMAGE RESULTS
    $wait.until { $driver.find_element(:xpath => '//*[@id="gallery-image-list"]/li[1]/div[1]/img') }
    element =  $driver.find_element(:xpath => '//*[@id="gallery-image-list"]/li[1]/div[1]/img')
    $wait.until {element.displayed?}
    sleep 2
    element.click
    ic = ImageCropper.new
    ic.set_caption("Test Caption")
    ic.toggle_full_width
    ic.submit_crop
  end

  def Legacy.add_photo(index)
    buttons = $wait.until { $driver.find_elements(:class => 'add-photo') }
    buttons[index].click
    self.getty_search
  end
end