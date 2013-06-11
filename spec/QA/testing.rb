require File.join(File.dirname(__FILE__), 'libs/store_to_mongo')
require File.join(File.dirname(__FILE__), 'pages/write')
include Write

describe 'MongoHQ' do
  it 'Can Return Image Stats' do

    get_image_stats
  end
end