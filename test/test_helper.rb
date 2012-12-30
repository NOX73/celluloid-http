require 'bundler/setup'
Bundler.require

require 'minitest/autorun'
require "mocha/setup"

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

class TestCase < MiniTest::Unit::TestCase

  def fixture_file(name)
    File.open("test/fixtures/#{name}")
  end

  def stub_connection_with_fixture(name)
    socket = TcpSocketStub.new fixture_file(name)
    Celluloid::IO::TCPSocket.stubs(:new).returns(socket)
  end

end
