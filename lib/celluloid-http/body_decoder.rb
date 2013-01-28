class Celluloid::Http::BodyDecoder

  class<<self

    def decode(headers, raw_body)
      new(headers, raw_body).decode.body
    end

  end

  attr_reader :headers, :body
  def initialize(headers, raw_body)
    @headers, @body = headers, raw_body
  end

  def decode
    @body = gunzip(@body) if zip?
    self
  end

  def gunzip(body)
    Zlib::GzipReader.new(StringIO.new(body)).read
  end

  def zip?
    @headers['Content-Encoding'] == 'gzip'
  end

end
