class ArticleNavigation

  def ArticleNavigation.next_step
    next_step = $driver.find_element(:link, 'Next Step »')
    $wait.until { next_step } 
    next_step.click
  end

  def ArticleNavigation.step_two
    $driver.find_element(:xpath => '//*[@id="create_steps"]/ul/li[2]/a').click
  end
end