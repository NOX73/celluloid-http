module Celluloid::Http::Http

  def send_request(request)
    connection = Celluloid::Http::Connection.open(request.host, request.port)
    connection.send_request request

    response = connection.response
    connection.close
    response
  end

  def get(*args)
    send_request Celluloid::Http::Builder.get(*args)
  end

  def post(*args)
    send_request Celluloid::Http::Builder.post(*args)
  end

end