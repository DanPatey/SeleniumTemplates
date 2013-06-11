class ArticleView
  def initialize
    # EDITOR TOOLS
    @history = $driver.find_element(:link_text => 'Article History')
  end

  def ArticleView.check_primary_image
    primary_img = $wait.until { $driver.find_elements(:class => 'media-slot') }
    $img_url.should == primary_img[0].find_element(:css => 'img').attribute('src').match(/([0-9]+)_crop/)[1]
  end

  def ArticleView.edit
    $driver.find_element(:link_text => 'Edit This Article').click
  end

  def ArticleView.add_comment(text)
    $driver.find_element(:class, 'textarea').send_keys(text)
    $driver.find_element(:link_text, 'Post Comment').click
  end
end