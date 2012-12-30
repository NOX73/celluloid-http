class TcpSocketStub
  extend Forwardable

  def_delegators :@file, :readpartial, :read, :close

  def initialize(file)
    @file = file
  end

  def write(*args)
    # stub
  end

end