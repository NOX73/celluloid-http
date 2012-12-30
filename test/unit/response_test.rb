require 'test_helper'

class ResponseTest < TestCase

  def test_create_http_response
    body = '<!DOCTYPE html><html><head><heed><body>BODY</body></html>'
    headers = {"Content-Length" => '172911'}
    response = Celluloid::Http::Response.new :ok, headers, body

    assert_equal :ok, response.status
    assert_equal headers, response.headers
    assert_equal body, response.body
  end

  def test_parse_http_response
    fixture_response = fixture_file("en.wikipedia.org")

    response = Celluloid::Http::Response.new

    while chunk = fixture_response.read(128)
      response << chunk
    end

    assert response.finished?
    assert_equal 200, response.status
    assert_equal "172911", response.headers["Content-Length"]
    assert_equal "en", response.headers["Content-Language"]
  end


end
