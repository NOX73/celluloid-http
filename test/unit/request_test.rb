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

  def test_parse_query_params
    request = Celluloid::Http::Request.new 'http://127.0.0.1?param1=value1&param2=value2'

    assert_equal 'value1', request.query_params['param1']
    assert_equal 'value2', request.query_params['param2']
  end

  def test_merge_query_params
    request = Celluloid::Http::Request.new 'http://127.0.0.1?param1=value1&param2=value2', {
        query_params: {'param3' => 'value3'}
    }

    assert_equal 'value1', request.query_params['param1']
    assert_equal 'value2', request.query_params['param2']
    assert_equal 'value3', request.query_params['param3']

    assert_equal 'http://127.0.0.1?param1=value1&param2=value2&param3=value3', request.url
  end

  def test_change_query_params
    request = Celluloid::Http::Request.new 'http://127.0.0.1?param1=value1&param2=value2'

    request.query = request.query_params.merge 'param3' => 'value3'

    assert_equal 'value1', request.query_params['param1']
    assert_equal 'value2', request.query_params['param2']
    assert_equal 'value3', request.query_params['param3']
  end

  def test_get_http_request_to_s
    request = Celluloid::Http::Request.new 'http://localhost?param=value'

    string_request = <<-eos
GET /?param=value HTTP/1.1
HOST: localhost

eos

    assert_equal string_request, request.to_s
  end


end
