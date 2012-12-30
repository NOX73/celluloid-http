require 'bundler/setup'
Bundler.require

MiniTest::Unit.autorun

#Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

class TestCase < MiniTest::Unit::TestCase

  def fixture_file(name)
    File.open("test/fixtures/#{name}")
  end

end
