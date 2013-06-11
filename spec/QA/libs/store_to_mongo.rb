require 'mongo'
require 'json'

class StoreToMongo
  def initialize
    @db = get_connection
    @coll = @db['timings']
    @hr = "-" * 78
  end

  def get_connection
    return @db_connection if @db_connection
    db = URI.parse(ENV['MONGOHQ_URL'])
    db_name = db.path.gsub(/^\//, '')
    @db_connection = Mongo::Connection.new(db.host, db.port).db(db_name)
    @db_connection.authenticate(db.user, db.password) unless (db.user.nil? || db.user.nil?)
    @db_connection
  end    

  def store_timing(time_elapsed, type, search=nil)
    new_record = { 
      :time_elapsed => time_elapsed, 
      :date => Time.now,
      :branch => $branch_name,
      :env => ENV['ENVIRONMENT'],
      :search_term => $search_term,
      :type =>  type,
      :test => $name
    }
    new_search_id = @coll.insert(new_record)
  end

  def calculate_stats(type)
    sum = 0
    all_searches = @coll.find({"type" => "#{type}"}, 
      :fields => ["time_elapsed"], 
      :sort => ["date" , :desc])
    num_of_image_searches = all_searches.count
    avg_image_search_time = @coll.aggregate([ {"$group" => {"_id"=>"$type", "avg"=> {"$avg"=>"$time_elapsed"}}}, {"$match" => {"_id"=>"#{type}"}} ]).first['avg']
    last_image_search = all_searches.first
    image_queries = "#{@hr}\nLast timing for #{type} took: #{last_image_search['time_elapsed']}ms\nAvg of #{num_of_image_searches} timings is: #{avg_image_search_time.to_i}ms\n#{@hr}"
  end
  
end