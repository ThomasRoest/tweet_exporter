# TweetExporter

Export your favorited tweets to simple html pages. (To backup and for easy searching)

![tweet-exporter](https://s3-eu-west-1.amazonaws.com/github-images123/tweet_exporter.jpg)
 
## Installation

After checking out the repo, run `bin/setup` to install dependencies. 
Go to [twitter apps](https://apps.twitter.com/) to create a new app with access credentials. Create a .env file with your twitter keys. (Consumer Key and Secret, see the example .env file)

To retrieve a new batch of favorites
run `bin/console`

`obj = TweetExporter::User.new('yourusername')` and `obj.export_tweets`

This will export a batch of twitter favorites around the maximum of 200, starting with the most recent. Run the command a second time to retrieve the next batch. 


<!-- ## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tweet. -->


## License

[MIT License](http://opensource.org/licenses/MIT).

 