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

  def test_http_get_gzip_method
    stub_connection_with_fixture("gzip.wikipedia.org")

    response = Celluloid::Http.get('http://en.wikipedia.org/wiki/Chunked_transfer_encoding')

    assert_match /Chunked transfer encoding/, response.body
  end

  def test_http_post_method
    stub_connection_with_fixture("post.example.com")

    params = { :comment => { :message => "My comment." } }
    response = Celluloid::Http.post('http://example.com/api/comments', params)

    assert_match /"message":"My comment."/, response.body
  end

end
