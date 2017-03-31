require "tweet_exporter/filtered_favorite"
require "yaml"

module TweetExporter
  class User
    attr_reader :user, :favorites, :filtered_favorites

    def initialize
      config = { 
        consumer_key: ENV["CONSUMER_KEY"], 
        consumer_secret: ENV["CONSUMER_SECRET"] 
      }
      @client = Twitter::REST::Client.new(config)
      @user = Object.new
      @favorites = []
      @filtered_favorites = []
    end

    def get_user
      # cli user arg
      @user = @client.user("trwroest")
    end

    def get_favorited_tweets
      # set count to user.favorites_count
      @favorites = @client.favorites(@user, count: 5)
    end

    def filter_tweets
      @filtered_favorites = @favorites.map{ |obj| 
                              TweetExporter::FilteredFavorite.new(id: obj.attrs[:id], 
                                                          username: obj.attrs[:user][:name], 
                                                          text: obj.attrs[:text] ) }
    end


    def export_tweets
      # create directory if not present
      File.write('tweets/hellotest.yaml', YAML.dump(@filtered_favorites))
    end

  end
end