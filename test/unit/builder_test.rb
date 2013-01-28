require 'test_helper'

class BuilderTest < TestCase

  def test_create_get_request
    url = 'http://en.wikipedia.org/wiki/Http?param=value'

    request = Celluloid::Http::Builder.get(url)

    assert_equal "en.wikipedia.org", request.host
    assert_equal :get, request.method
  end

  def test_create_post_request
    url = 'http://en.wikipedia.org/wiki/Http?param=value'

    params = {:param2 => "value2"}

    request = Celluloid::Http::Builder.post(url, params)

    assert_equal "en.wikipedia.org", request.host
    assert_equal :post, request.method
  end



end
