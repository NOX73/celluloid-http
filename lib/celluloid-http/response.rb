class Celluloid::Http::Response
  extend Forwardable

  STATUS_CODES          = Rack::Utils::HTTP_STATUS_CODES

  def_delegators :parser, :<<

  attr_writer :status
  attr_accessor :headers, :body

  def initialize(status = nil, headers = {}, body = "")
    @status, @headers, @body = status, headers, body
    @finished = false
  end

  def status
    @status || parser.status_code
  end

  def on_message_complete
    @finished = true
  end

  def finished?
    @finished
  end

  def on_body(chunk)
    @body << chunk
  end

  def on_headers_complete(headers)
    @headers = headers
  end

  def parser
    @parser ||= Http::Parser.new(self)
  end

  def reason
    STATUS_CODES[status]
  end

  def sym_status
    reason.downcase.gsub(/\s|-/, '_').to_sym
  end

end