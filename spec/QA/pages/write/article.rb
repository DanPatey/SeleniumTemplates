require File.join(File.dirname(__FILE__), 'writerhq')

class Article < WriterHQ

  def Article.add_content
    $driver.find_element(:id, 'article_headline_input').send_keys($name)
    f = File.open(File.join(File.dirname(__FILE__), '../../WritingExample.txt'))
    s = f.read
    # Switch to frame of editor so that text can be inputed
    $driver.switch_to.frame "editor_ifr"
    $driver.switch_to.active_element.send_keys(s)
    $driver.switch_to.default_content
  end

  def Article.skip_spellcheck
    spellcheck = $driver.find_element(:id, 'spell_check_button')
    $driver.action.move_to(spellcheck, 10, 10).click.perform
    done = $driver.find_element(:id => "spell_check_button_done")
    $wait.until {done.displayed?}
    $driver.action.move_to(done, 10, 2).click.perform
    ArticleNavigation.next_step
  end  
end

class ArticleNavigation

  def ArticleNavigation.next_step
    next_step = $driver.find_element(:xpath => '//*[@id="create_steps"]/ul/li[4]/a')
    $wait.until { next_step.location_once_scrolled_into_view } 
    next_step.click
  end

  def ArticleNavigation.step_two
    $driver.find_element(:xpath => '//*[@id="create_steps"]/ul/li[2]/a').click
  end
end
