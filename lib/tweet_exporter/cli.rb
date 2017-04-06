require 'thor'
require 'tweet_exporter'

module TweetExporter
  class CLI < Thor

    desc 'cli', 'test'
    def get_name(name)
      puts "hello #{name}"
    end

    # def get_tweets
    # end

  end
end

# bundle exec exe/tweetexporter get_name thomas