require 'thor'
require 'tweet_exporter'

module TweetExporter
  class CLI < Thor

    # cli cannot be used for retrieving consecutive batches 
    # no persistent store of 'since_id'
    desc 'cli', 'test'
    def get_name(name)
      obj = TweetExporter::User.new('username')
      obj.execute
    end
  end
end

# bundle exec exe/tweetexporter get_name thomask