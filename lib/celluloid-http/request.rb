require 'active_support/core_ext/object/to_query'

class Celluloid::Http::Request
  extend Forwardable
  DEFAULT_METHOD = :get
  DEFAULT_HTTP_VERSION = '1.1'

  attr_accessor :method, :body

  def_delegators :@uri, :scheme, :host, :path, :port, :query
  def_delegators :@uri, :scheme=, :host=, :path=, :port=

  def initialize(url, options = {})
    @uri = URI.parse url
    @method = options[:method] || DEFAULT_METHOD
    @raw_body = options[:raw_body]

    merge_query_params(options[:query_params]) if options[:query_params]
  end

  def query_params
    Rack::Utils.parse_nested_query @uri.query
  end

  def to_s
    "#{method.to_s.upcase} #{uri} HTTP/#{DEFAULT_HTTP_VERSION}\nHOST: #{host}\n\n"
  end

  def url
    @uri.to_s
  end

  def uri
    "#{ "/" if path.length.zero? }#{path}#{ "?" if query }#{query}"
  end

  def query=(val)
    @uri.query = val.is_a?(Hash) ? val.to_query : val
  end

  def merge_query_params(params)
    params = query_params.merge params
    self.query = params
  end

end