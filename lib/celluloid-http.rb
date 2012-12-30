require "celluloid-http/version"
require "uri"
require "http_parser.rb"

module Celluloid
  module Http
    autoload :Request, 'celluloid-http/request'
    autoload :Response, 'celluloid-http/response'

  end
end
