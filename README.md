# TweetExporter

Ruby project to export your favorited tweets to html pages.
 
## Installation

After checking out the repo, run `bin/setup` to install dependencies. 
Create an .env file with your twitter keys.
Run `bin/console` for an interactive prompt that will allow you to experiment.

To retrieve a new batch of favorites
run `bin/console`

`obj = TweetExporter::User.new('yourusername')` and `obj.execute`

This will export a batch of twitter favorites (193), starting with the most recent. Run the command a second time to retrieve the next. 

<!-- Add this line to your application's Gemfile:

```ruby
gem 'tweet_exporter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tweet

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tweet.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

 -->