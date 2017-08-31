# SmartUri

## Because building URI's with base URI class is FUBAR, particularly join method

### Examples of normal URI behavior

``` ruby
URI.parse('http://myapi.com').join('posts', '1')
=> undefined method 'join' for #<URI::HTTP http://myapi.com>
```

``` ruby
URI.join('http://myapi.com', 'posts', '1')
=> "http://myapi.com/1"
```

``` ruby
URI.join('http://myapi.com', '/posts/', '1')
=> "http://myapi.com/posts/1"
```

### Examples of SmartURI behavior
``` ruby
::SmartURI.join('http://myapi.com', 'posts', '1').to_s
 => "http://myapi.com/posts/1"
```

``` ruby
SmartURI.parse('http://myapi.com', 'posts', '1').to_s
 => "http://myapi.com/posts/1"
 ```

``` ruby
 base_uri = ::SmartURI.join('http://myapi.com')
 base_uri.join('posts', :query => {:id => 1}).to_s
 => "http://myapi.com/posts?id=1"
 ```

As you can see, it makes building URI's / working with API's much easier

Under the hood it just uses SimpleDelegator, so all the normal URI methods should,
work when working with a SimpleURI object

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'smart_uri'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smart_uri

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/smart_uri.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
