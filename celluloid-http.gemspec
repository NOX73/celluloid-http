# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'celluloid-http/version'

Gem::Specification.new do |gem|
  gem.name          = "celluloid-http"
  gem.version       = Celluloid::Http::VERSION
  gem.authors       = ["Rozhnov Alexandr"]
  gem.email         = ["gnox73@gmail.com"]
  gem.description   = %q{Http requests for celluloid.}
  gem.summary       = %q{Http requests for celluloid. Based on Celluloid::IO.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency('rack')
  gem.add_runtime_dependency('celluloid-io')
  gem.add_runtime_dependency('http_parser.rb')

  gem.add_development_dependency('turn')
  gem.add_development_dependency('minitest')
  gem.add_development_dependency('mocha')
end
