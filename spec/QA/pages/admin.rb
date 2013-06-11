require File.join(File.dirname(__FILE__), '../libs/test_helper')
class Admin
  def initialize(user)
    TestHelper.new.login(user)

  end

end