class ContentPlayer
  def initialize
    page_header_actions  = $driver.find_elements(:id => '//*[@id="page-header-actions"]/a')
    @send_push_notification = page_header_actions[0]
    @recon_mpressions = page_header_actions[1]
    @children_add_content = $driver.find_element(:id => "children-add-content")
    @newsletter = $driver.find_element(:xpath => '//*[@id="channels"]/div[1]/ul/li[2]/a')  
  end

  def select_newsletter
    @newsletter.click
    @preview_newsletter = $driver.find_element(:id => 'preview-newsletter-button')
    @send_newsletter = $driver.find_element(:id => 'send-newsletter-button')
    @new_newsletter =  $driver.find_element(:id => 'new-newsletter-button')
    $wait.until { $driver.find_element(:xpath => '//*[@id="channels"]/div[1]/ul/li[2]/a').location_once_scrolled_into_view }
    @affiliate_link = $driver.find_element(:xpath => '//*[@id="channels"]/div[1]/ul/li[2]/a')
  end

  def add_article_from_affiliate(externalurl)
    @affiliate_link.click
    $wait.until { $driver.find_element(:id => 'articles-add-content') }
    url_field = $wait.until { $driver.find_element(:class => 'url') }
    url_field.send_keys(externalurl)
    sleep 2
    $driver.find_element(:class => 'save-content').click
  end
end
