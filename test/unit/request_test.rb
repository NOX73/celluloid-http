require 'test_helper'

class RequestTest < TestCase

  def test_create_http_request
    url = 'http://en.wikipedia.org/wiki/Http?param=value'

    request = Celluloid::Http::Request.new url

    assert_equal url, request.url
    assert_equal :get, request.method
    assert_equal 80, request.port
    assert_equal "http", request.scheme
    assert_equal "en.wikipedia.org", request.host
    assert_equal "/wiki/Http", request.path
    assert_equal "param=value", request.query
  end

end
