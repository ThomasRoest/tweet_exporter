require "tweet_exporter/filtered_favorite"
require "tweet_exporter/html_builder"
require "yaml"

module TweetExporter
  class User
    attr_reader :user, :favorites, :filtered_favorites, :client

    def initialize()
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["CONSUMER_KEY"]
        config.consumer_secret     = ENV["CONSUMER_SECRET"] 
        config.access_token        = ENV["ACCESS_TOKEN"]
        config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
      end

      @user_arg = user
      @user = Object.new
      @favorites = []
      @filtered_favorites = []
      get_user
      get_favorited_tweets
      filter_tweets
    end

    def get_user
      # cli user arg
      @user = @client.user('trwroest')
    end

    def get_favorited_tweets
      @favorites = @client.favorites(@user, count: 100)
      # count (Integer) — Specifies the number of records to retrieve. Must be less than or equal to 100.
      # :since_id (Integer) — Returns results with an ID greater than (that is, more recent than) the specified ID.
    end

    def filter_tweets
      @filtered_favorites = @favorites.map{ |obj| 
                              TweetExporter::FilteredFavorite.new(id: obj.attrs[:id], 
                                                           username: obj.attrs[:user][:name], 
                                                          text: obj.attrs[:text],
                                                          urls: obj.attrs[:entities][:urls] ) }
    end


    def unlike_tweet
      # @client.status(848077321038737409)
      # obj.client.unfavorite(848080581313343488, 848083460325425152, 848077321038737409)
    end


    def export_tweets
      TweetExporter::HtmlBuilder.new(@filtered_favorites)
    end
  end
end