# Celluloid::Http

Http request implementation based on celluloid::io.

## Installation

Add this line to your application's Gemfile:

    gem 'celluloid-http'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install celluloid-http

## Usage

    Celluloid::Http.get('http://en.wikipedia.org/wiki/Http')

See test/unit/http_test.rb for more examples.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write code
4. Run test (`bundle exec rake test`)
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request
