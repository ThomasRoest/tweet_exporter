require "tweet_exporter/filtered_favorite"
require "tweet_exporter/html_builder"

module TweetExporter
  class User
    attr_reader :user, :favorites, :filtered_favorites, :client, :max_id

    def initialize()
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["CONSUMER_KEY"]
        config.consumer_secret     = ENV["CONSUMER_SECRET"] 
        config.access_token        = ENV["ACCESS_TOKEN"]
        config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
      end

      # @user_arg = user
      @user = Object.new
      @favorites = []
      @filtered_favorites = []
      @max_id = nil
      @export_count = nil
      get_user
    end

    def get_user
      # set to cli arg
      @user = @client.user('trwroest')
    end

    def execute
      get_favorited_tweets
      filter_tweets
      export_tweets
    end

    def get_favorited_tweets
      if max_id == nil
        @favorites = @client.favorites(@user, count: 150)
        @max_id = @favorites[-1].attrs[:id]
      else
        @favorites = @client.favorites(@user, count: 150, max_id: @max_id)
        @max_id = @favorites[-1].attrs[:id]
      end
      @favorites
    end

    def filter_tweets
      @filtered_favorites = @favorites.map{ |obj| 
                              TweetExporter::FilteredFavorite.new(id: obj.attrs[:id], 
                                                                  profile_image_url: obj.attrs[:user][:profile_image_url],
                                                                  username: obj.attrs[:user][:name], 
                                                                  text: obj.attrs[:text],
                                                                  urls: obj.attrs[:entities][:urls] ) }
    end


    # add tweet.created_at in builder 
    def export_tweets
      @export_count = 1 if @export_count == nil
      TweetExporter::HtmlBuilder.new(@filtered_favorites, @export_count)
      @export_count += 1
      "exported #{@favorites.count} tweets"
    end


    def unlike_tweet
      # @client.status(848077321038737409)
      # obj.client.unfavorite(848080581313343488, 848083460325425152, 848077321038737409)
    end
  end
end