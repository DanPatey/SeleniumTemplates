require File.join(File.dirname(__FILE__), 'spec_helper')

# tests based on google doc from 2-bit labs: http://bit.ly/uyzTZH 
# PUT /api/mobile/notifications/1.0/
# /api/mobile/version.json?devicetype=android&osversion=2.2&appversion=1.2
def json(url)
  @driver.goto url
  source = @driver.page_source
  md = source.match(%r{<pre.*?>(.*)<\/pre>})
  json = md[1]
  data = Yajl::Parser.new.parse(json)
end

def assert_front_lead_articles(data)
  data.each do |item|
    item.should be_a(Hash)
    item.each do |key, value|
      key.should be_a(String)
      value.should be_a(String)
    end
  end
end

def assert_stream_first(data)
  data.should be_a(Hash)
  data.each do |key, value|
    key.should be_a(String)
    value.should be_a(Hash)
    value.each do |key, value|
      key.should be_a(String)
      value.should be_a(String)
    end
  end
end

def assert_mobile_notifications(data)
  data.should be_a(Array)
  data.each do |item|
    item.should be_a(Hash)
    item.each do |key, value|
      key.should be_a(String)
      if value.is_a?(String)
        value.should be_a(String)
      else
        value.should be_a(Integer)
      end
    end
  end
end

def assert_mobile_version(data)
  data.should be_a(Hash)
  data.each do |key, value|
    key.should be_a(String)
    value.should be_a(Array)
    value.each do |item|
      item.should be_a(String)
    end
  end
end

def assert_front_v2_lead_articles(data)
  data.should be_a(Hash)
  data.each do |key, value|
    key.should be_a(String)
    if value.is_a?(Array)
      value.each do |item|
        item.should be_a(Hash)
        item.each do |key, value|
          key.should be_a(String)
          value.should be_a(String)
        end
      end
    else
      value.should be_a(Integer)
    end
  end	
end

def run_specs?
  (ENV['BROWSER'] == 'chrome' && ENV['OS'].to_s == 'VISTA') or ENV['TEST_ENV'] == 'local'
end

describe 'The Mobile API', :if => run_specs? do
  it 'Should Have Front Lead Articles' do
    data = json("/api/front/lead_articles.json")
    assert_front_lead_articles(data)
  end

  it 'Should Have Front Lead Articles On iPad 1.5' do
    data = json("/api/front/lead_articles.json?appversion=1.5&devicetype=ipad&perpage=10")
    assert_front_lead_articles(data)
  end

  it 'Should Have Front Lead Articles On iPad With Teams' do
    data = json("/api/front/lead_articles.json?tags=stanford-football,san-francisco-49ers,san-francisco-giants&appversion=1.5&devicetype=ipad&perpage=10")
    assert_front_lead_articles(data)
  end

  it 'Team Stream Should Have Teams' do
    data = json("/api/stream/first.json?tags=stanford-football,san-francisco-49ers,san-francisco-giants")
    assert_stream_first(data)
  end

  it 'Should Have Android Notifications' do
    data = json("/api/mobile/notifications/1.0/?device_id=APA91bEItD7expFXXY8oMdopbvFfqINajG6jTVQn7oakd8H4JntNsdSHcvMNZtk6_sqlr6GLJNlYjHXNceJkEo-BMVDH1T9XmyCQJJZgWWXSTtWfr6CuIVDLr4QkEbXOGmSqFWFFA4PEaTOSjxWgZGvfthvIScDZbe_CetdxvSFCj88Jd5HV34M")
    assert_mobile_notifications(data)
  end

  it 'Should Have iOS Notifications' do
    data = json("/api/mobile/notifications/1.0/?device_id=386d76238da12af7e8ac079c0ac184b8cbf412f5bdff128967fb8b0f66ca4eba")
    assert_mobile_notifications(data)
  end

  it 'Should Have A Mobile Version' do
    data = json("/api/mobile/version.json")
    assert_mobile_version(data)
  end

  it 'Should Have A Android Version' do
    data = json("/api/mobile/version.json?devicetype=android")
    assert_mobile_version(data)
  end

  it 'Should Have Lead Articles On iPad Version 2' do
    data = json("/api/front/v2/lead_articles.json?perpage=5&devicetype=ipad")
    assert_front_v2_lead_articles(data)
  end

  it 'Should Have Lead Articles On iPad Version 2 With Teams' do  
    data = json("/api/front/v2/lead_articles.json?tags=san-francisco-49ers,oakland-raiders&perpage=5&devicetype=ipad")
    assert_front_v2_lead_articles(data)
  end
end
