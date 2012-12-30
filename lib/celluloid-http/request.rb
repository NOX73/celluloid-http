class Celluloid::Http::Request
  extend Forwardable
  DEFAULT_METHOD = :get
  DEFAULT_HTTP_VERSION = '1.1'

  attr_reader :url
  attr_accessor :method

  def_delegators :@uri, :scheme, :host, :port, :path, :query

  def initialize(url, options = {})
    @url = url
    @uri = URI.parse url
    @method = options[:method] || DEFAULT_METHOD
  end

  def to_s
    path = self.path.length.zero? ? "/" : self.path
    "#{method.to_s.upcase} #{path} HTTP/#{DEFAULT_HTTP_VERSION}\nHOST: #{host}\n\n"
  end

end