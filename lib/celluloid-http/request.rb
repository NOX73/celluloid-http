class Celluloid::Http::Request
  extend Forwardable
  DEFAULT_METHOD = :get

  attr_reader :url
  attr_accessor :method

  def_delegators :@uri, :scheme, :host, :path, :query

  def initialize(url, options = {})
    @url = url
    @uri = URI.parse url
    @method = options[:method] || DEFAULT_METHOD
  end

end