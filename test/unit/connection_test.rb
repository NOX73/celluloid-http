require 'test_helper'

class ConnectionTest < TestCase

  def test_static_constructor
    connection = mock('Connection')
    connection.expects(:open).with('host',8080)
    Celluloid::Http::Connection.expects(:new).returns(connection)

    Celluloid::Http::Connection.open('host',8080)
  end
end
