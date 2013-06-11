class SlideShow

  def SlideShow.create(amount)
    header = $wait.until { $driver.find_element(:xpath => '//*[@id="bleacherreport"]/body/div[15]/div[1]/h3')}
    header.text.should == "Create slideshow"
    title = $driver.find_element(:id => 'slideshow-title')
    title.send_keys $name
    slides = $driver.find_element(:id => "num-slides")
    slides.find_element(:css => "option[value='#{amount}']").click
    create = $driver.find_element(:id => "slideshow-create-submit")
    create.click
  end

  def SlideShow.verify_title(title)
    $driver.find_element(:id => 'article_headline_input')
    $driver.find_element(:class => 'slide_title')
  end
  #################################
  #       LEGACY CMS              #
  #################################
  def SlideShow.go_to_slide(num)
    slides = $driver.find_elements(:class => 'slideshow_slide')
    slides[num].click
  end

end