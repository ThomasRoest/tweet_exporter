module TweetExporter
  class HtmlBuilder
    def initialize(tweets)
      @tweets = tweets
      build_html
    end

    # create directory if not present?
    def build_html
     full_urls = @tweets.map{|tweet| 
      "<p><b>#{tweet.username}</b></p>\
       <p>#{tweet.text}<a href='https://twitter.com/i/web/status/#{tweet.id}'>#{tweet.id}</a></p> \
       <p>#{tweet.urls}</p>
       "
    }      

     File.write("tweets/tweets#{rand(1..1000)}.html", full_urls.join())  

    end
  end
end


# <a href=#{tweet.expanded_url}>#{tweet.expanded_url}</a>"