class Topics
  def initialize
    @input = $wait.until { $driver.find_element(:id => 'tag-chooser') }
  end

  def set_tag(term=$search_term, option=0)
    @input.send_keys(term)
    @input.send_keys :enter
    x = get_options
    x[option].click
  end

  def get_options
    options = $wait.until { $driver.find_elements(:class => 'tag-chooser-name') }
  end

  def skip_article_tags_and_publish
    multiple_leagues_checkbox = $wait.until { $driver.find_element(:id => "multiple-sports-leagues-tag") }
    multiple_leagues_checkbox.click
    set_type("breaking_news")
    Topics.publish
  end

  def Topics.publish
    $driver.find_element(:link, 'PUBLISH ARTICLE').click
  end

  def set_type(id)
    # lowercase and underline option  
    el = $driver.find_element(:id => "#{id}_tag")
    $wait.until { el.displayed? }
    el.click
  end

end