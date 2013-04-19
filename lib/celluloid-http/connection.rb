class Celluloid::Http::Connection
  include Celluloid::IO
  attr_reader :socket

  def open(host, port = 80)
    @socket = TCPSocket.new(host, port)
  end

  def close
    socket.close
  end

  def send_request(request)
    socket.write(request.to_s)
  end

  def response
    response = Http::Response.new

    until response.finished?
      begin
        chunk = socket.readpartial(4096)
      rescue EOFError
        # do nothing
      ensure
        response << chunk
      end
    end

    response
  end

  def self.open(host, port = 80)
    connection = self.new
    connection.open(host, port)
    connection
  end

end
