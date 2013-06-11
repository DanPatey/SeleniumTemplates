# encoding: utf-8
require File.join(File.dirname(__FILE__), 'content_player')
class Newsletter < ContentPlayer
  def initialize
    super
    @preview_newsletter = $driver.find_element(:id => 'preview-newsletter-button')
    @send_newsletter = $driver.find_element(:id => 'send-newsletter-button')
    @new_newsletter =  $driver.find_element(:id => 'new-newsletter-button')
    @affiliate_link = $driver.find_element(:xpath => '//*[@id="channels"]/div[1]/ul/li[2]/a')
  end


end