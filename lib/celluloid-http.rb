require "celluloid-http/version"
require "uri"
require "http_parser.rb"
require "celluloid/io"

module Celluloid
  module Http
    autoload :Response, 'celluloid-http/response'
    autoload :Request, 'celluloid-http/request'
    autoload :Http, 'celluloid-http/http'
    autoload :Connection, 'celluloid-http/connection'

    extend Http
  end
end
