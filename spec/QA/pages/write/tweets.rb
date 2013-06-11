require File.join(File.dirname(__FILE__), 'media')
class Tweets

  def search
    s = Time.now.to_i
    Media.search
    verify_results
    $th.end_timer(s,"tweet_search")
  end

  def embed(url,paragraph)
    embed_button = $driver.find_element(:xpath => '//*[@id="custom-content-btns"]/span[2]')
    embed_button.click
    url_input = $wait.until { $driver.find_elements(:xpath => '//*[@id="custom-content"]/div[1]/textarea')[1] }
    url_input.send_keys(url)
    submit = $driver.find_elements(:xpath => '//*[@id="custom-content"]/div[1]/a[2]')[1]
    submit.click
    Media.drag_and_drop(verify_tweet_embedded,paragraph)
    sleep 2
  end

  def insert(paragraph)
    s = Time.now.to_i
    tweet = $wait.until { $driver.find_element(:class => "tweet-item") }
    Media.drag_and_drop(tweet, paragraph)
    verify_tweet_added_successfully
    $th.end_timer(s,"insert_tweet")
  end

  def move(source,target)
    s = Time.now.to_i
    Media.move(source,target)
    verify_tweet_added_successfully
    $th.end_timer(s,"move_tweet")
    sleep 2
  end

  def delete(num)
    s = Time.now.to_i
    Media.delete(num)
    $th.end_timer(s,"delete_tweet")
  end
  
  def verify_tweet_added_successfully 
    @edit_tweet = $wait.until { $driver.find_element(:class => "add-tweet") }
    @delete_tweet = $wait.until { $driver.find_element(:class => "trash") }
  end

  def edit_tweet_embed_url(tweet,url)
    tweets = $driver.find_elements(:class => "add-tweet")
    tweets[tweet].click
    $wait.until { $driver.find_element(:xpath => '//*[@id="bleacherreport"]/body/div[15]/div[1]/h3').text.should == "Embed Tweet" }
    embed_tweet_input = $wait.until { $driver.find_element(:id => "tweetUrlField") }
    embed_tweet_button = $wait.until { $driver.find_element(:id => "tweetEmbedButton") }
    embed_tweet_close = $wait.until { $driver.find_element(:class => "close")}
    embed_tweet_input.send_keys(url)
  end

  def verify_tweets(count)
    tweet = $wait.until { $driver.find_elements(:class => 'media_area_content')[count] }
    tweet.should != nil
  end

  def verify_tweet_embedded
    tweet = $wait.until { $driver.find_element(:xpath => '//*[@id="discovery-tweet-embed"]/div') }
  end

end