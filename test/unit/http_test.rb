require 'test_helper'

class HttpTest < TestCase

  def test_get_http_request
    stub_connection_with_fixture("en.wikipedia.org")

    request = Celluloid::Http::Request.new 'http://en.wikipedia.org/wiki/Http'
    response = Celluloid::Http.send_request request

    assert_match /Wikipedia, the free encyclopedia/, response.body
  end

  def test_http_get_method
    stub_connection_with_fixture("en.wikipedia.org")

    response = Celluloid::Http.get('http://en.wikipedia.org/wiki/Http')
    assert_match /Wikipedia, the free encyclopedia/, response.body
  end

end
