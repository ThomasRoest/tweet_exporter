require "tweet_exporter/filtered_favorite"
require "tweet_exporter/html_builder"

module TweetExporter
  class User
    def initialize(username)
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["CONSUMER_KEY"]
        config.consumer_secret     = ENV["CONSUMER_SECRET"] 
        # config.access_token        = ENV["ACCESS_TOKEN"]
        # config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
      end

      @username = username
      @favorites = nil
      @filtered_favorites = nil
      @max_id = nil
      @export_count = nil
      @client_user = @client.user(@username)
    end

    def export_tweets
      get_favorited_tweets
      filter_tweets
      build_tweets
    end

    private

      def get_favorited_tweets
        if @max_id == nil
          @favorites = @client.favorites(@client_user, count: 200)
        else
          @favorites = @client.favorites(@client_user, count: 200, max_id: @max_id)
        end
        @max_id = @favorites[-1].attrs[:id]
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

      def build_tweets
        @export_count = 1 if @export_count == nil
        TweetExporter::HtmlBuilder.new(@filtered_favorites, @export_count, @username)
        @export_count += 1
        "exported #{@favorites.count} tweets to /tweets"
      end


      # def unlike_tweet
      #   # @client.status(848077321038737409)
      #   # obj.client.unfavorite(848080581313343488, 848083460325425152, 848077321038737409)
      # end
  end
end