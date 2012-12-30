require 'test_helper'

class HttpTest < TestCase

  def test_get_http_request
    stub_connection_with_fixture("en.wikipedia.org")

    request = Celluloid::Http::Request.new 'http://en.wikipedia.org/wiki/Http'
    response = Celluloid::Http.send_requst request

    assert_match /Wikipedia, the free encyclopedia/, response.body
  end

end
